import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:chat/core/models/chat_user.dart';
import 'package:chat/core/service/auth/auth_service.dart';

class AuthMockService implements AuthService {
  static final _defaultUser = ChatUser(
    '1',
    'default',
    'default@default.dev',
    'assets/images/avatar.png',
  );

  static final Map<String, ChatUser> _users = {
    _defaultUser.email: _defaultUser,
  };
  static ChatUser? _currentUser;
  static MultiStreamController<ChatUser?>? _controller;

  static final _userStream = Stream<ChatUser?>.multi((controller) {
    _controller = controller;
    _updateUser(_defaultUser);
  });

  @override
  ChatUser? get currentUser => _currentUser;

  @override
  Future<void> login(
    String email,
    String password,
  ) async {
    _updateUser(_users[email]);
  }

  @override
  Future<void> logout() async {
    _updateUser(null);
  }

  @override
  Future<void> signup(
    String name,
    String email,
    String password,
    File? image,
  ) async {
    final user = ChatUser(
      Random().nextDouble().toString(),
      name,
      email,
      image?.path ?? 'assets/images/avatar.png',
    );
    _users.putIfAbsent(email, () => user);
    _updateUser(user);
  }

  @override
  Stream<ChatUser?> get userChanges => _userStream;

  static void _updateUser(ChatUser? chatUser) {
    _currentUser = chatUser;
    _controller!.add(_currentUser);
  }
}
