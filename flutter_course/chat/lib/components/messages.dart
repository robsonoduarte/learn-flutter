import 'package:chat/components/message_bubble.dart';
import 'package:chat/core/models/chat_message.dart';
import 'package:chat/core/service/auth/auth_service.dart';
import 'package:chat/core/service/chat/chat_service.dart';
import 'package:flutter/material.dart';

class Messages extends StatelessWidget {
  const Messages({super.key});

  @override
  Widget build(BuildContext context) {
    final currentUser = AuthService().currentUser;
    return StreamBuilder<List<ChatMessage>>(
      stream: ChatService().messagesStream(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
            child: Text("no messages, let's chat ?"),
          );
        } else {
          final messages = snapshot.data;
          return ListView.builder(
            reverse: true,
            itemCount: messages!.length,
            itemBuilder: (context, index) {
              return MessageBubble(
                key: ValueKey(messages[index].id),
                message: messages[index],
                belongsToCurrentUser: currentUser?.id == messages[index].userId,
              );
            },
          );
        }
      },
    );
  }
}
