import 'dart:async';

import 'package:chat/core/models/chat_message.dart';
import 'package:chat/core/models/chat_user.dart';
import 'package:chat/core/service/chat/chat_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatFirebaseService implements ChatService {
  @override
  Stream<List<ChatMessage>> messagesStream() {
    final store = FirebaseFirestore.instance;
    final snapshots = store
        .collection('chat')
        .withConverter(
          fromFirestore: _fromFirestore,
          toFirestore: _toFirestore,
        )
        .orderBy('createdAt', descending: true)
        .snapshots();
    return Stream<List<ChatMessage>>.multi((controller) {
      snapshots.listen((snapshot) {
        controller.add(snapshot.docs.map((e) => e.data()).toList());
      });
    });
  }

  @override
  Future<ChatMessage?> save(String text, ChatUser user) async {
    final store = FirebaseFirestore.instance;
    final chatMessage = ChatMessage(
      '',
      text,
      DateTime.now(),
      user.id,
      user.name,
      user.imageUrl,
    );
    final doc = await store
        .collection('chat')
        .withConverter(
          fromFirestore: _fromFirestore,
          toFirestore: _toFirestore,
        )
        .add(chatMessage);
    final snapshot = await doc.get();
    return snapshot.data()!;
  }

  Map<String, dynamic> _toFirestore(
    ChatMessage chatMessage,
    SetOptions? options,
  ) {
    return {
      'text': chatMessage.text,
      'createdAt': DateTime.now().toIso8601String(),
      'userId': chatMessage.userId,
      'userName': chatMessage.userName,
      'userImageURL': chatMessage.userImageURL,
    };
  }

  ChatMessage _fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> doc,
    SnapshotOptions? options,
  ) {
    return ChatMessage(
      doc.id,
      doc['text'],
      DateTime.parse(doc['createdAt']),
      doc['userId'],
      doc['userName'],
      doc['userImageURL'],
    );
  }
}
