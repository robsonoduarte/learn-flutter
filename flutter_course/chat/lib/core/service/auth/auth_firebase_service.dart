import 'dart:async';
import 'dart:io';

import 'package:chat/core/models/chat_user.dart';
import 'package:chat/core/service/auth/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
    userCredential.user?.updateDisplayName(name);
    //userCredential.user?.updatePhotoURL(photoURL);
  }

  static ChatUser _toChatUser(User user) {
    return ChatUser(
      user.uid,
      user.displayName ?? user.email!.split('@')[0],
      user.email!,
      user.photoURL ?? 'assets/images/avatar.png',
    );
  }
}
