import 'dart:async';

import 'package:chat/core/models/chat_message.dart';
import 'package:chat/core/models/chat_user.dart';
import 'package:chat/core/service/chat/chat_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatFirebaseService implements ChatService {
  @override
  Stream<List<ChatMessage>> messagesStream() {
    return const Stream.empty();
  }

  @override
  Future<ChatMessage?> save(String text, ChatUser user) async {
    final store = FirebaseFirestore.instance;
    await store.collection('chat').add({
      'text': text,
      'createdAt': DateTime.now().toIso8601String(),
      'userId': user.id,
      'userName': user.name,
      'userImageURL': user.imageUrl,
    });

    return null;

/*    final message = ChatMessage(
      Random().nextDouble().toString(),
      text,
      DateTime.now(),
      chatUser.id,
      chatUser.name,
      chatUser.imageUrl,
    );
    _messages.add(message);
    _controller!.add(_messages.reversed.toList());
    return message;*/
  }
}
