import 'dart:async';
import 'dart:math';

import 'package:chat/core/models/chat_message.dart';
import 'package:chat/core/models/chat_user.dart';
import 'package:chat/core/service/chat/chat_service.dart';

class ChatMockService implements ChatService {
  static final List<ChatMessage> _messages = [];
  static MultiStreamController<List<ChatMessage>>? _controller;
  static final _messagesStream = Stream<List<ChatMessage>>.multi((controller) {
    _controller = controller;
    controller.add(_messages);
  });

  @override
  Stream<List<ChatMessage>> messagesStream() {
    return _messagesStream;
  }

  @override
  Future<ChatMessage> save(String text, ChatUser chatUser) async {
    final message = ChatMessage(
      Random().nextDouble().toString(),
      text,
      DateTime.now(),
      chatUser.id,
      chatUser.name,
      chatUser.imageUrl,
    );
    _messages.add(message);
    _controller!.add(_messages.reversed.toList());
    return message;
  }
}
