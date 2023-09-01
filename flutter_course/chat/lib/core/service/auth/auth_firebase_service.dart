import 'dart:async';
import 'dart:io';

import 'package:chat/core/models/chat_user.dart';
import 'package:chat/core/service/auth/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AuthFirebaseService implements AuthService {
  static ChatUser? _currentUser;

  static final _userStream = Stream<ChatUser?>.multi((controller) async {
    final authChanges = FirebaseAuth.instance.authStateChanges();
    await for (final user in authChanges) {
      _currentUser = user == null ? null : _toChatUser(user);
      controller.add(_currentUser);
    }
  });

  @override
  ChatUser? get currentUser => _currentUser;
  @override
  Stream<ChatUser?> get userChanges => _userStream;

  @override
  Future<void> login(
    String email,
    String password,
  ) async {
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Future<void> signup(
    String name,
    String email,
    String password,
    File? image,
  ) async {
    final firebaseAuth = FirebaseAuth.instance;
    UserCredential userCredential =
        await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    if (userCredential.user == null) return;

    final url =
        await _uploadUserImage(image, '${userCredential.user!.uid}.jpg');

    await userCredential.user?.updateDisplayName(name);
    await userCredential.user?.updatePhotoURL(url);

    await _saveChatUser(_toChatUser(userCredential.user!, url));
  }

  Future<void> _saveChatUser(ChatUser user) async {
    final store = FirebaseFirestore.instance;
    final document = store.collection('users').doc(user.id);
    await document.set({
      'name': user.name,
      'email': user.email,
      'imageURL': user.imageUrl,
    });
  }

  Future<String?> _uploadUserImage(File? file, String name) async {
    if (file == null) return null;
    final storage = FirebaseStorage.instance;
    final imageRef = storage.ref().child('user_images').child(name);
    await imageRef.putFile(file).whenComplete(() => () {});
    return await imageRef.getDownloadURL();
  }

  static ChatUser _toChatUser(User user, [String? imageURL]) {
    return ChatUser(
      user.uid,
      user.displayName ?? user.email!.split('@')[0],
      user.email!,
      imageURL ?? user.photoURL ?? 'assets/images/avatar.png',
    );
  }
}
