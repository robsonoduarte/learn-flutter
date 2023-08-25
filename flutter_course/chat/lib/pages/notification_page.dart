import 'package:chat/core/service/notification/push_notification_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final chatNotificationService = context.read<ChatNotificationService>();
    final items = chatNotificationService.items;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: ListView.builder(
        itemCount: context.watch<ChatNotificationService>().itemsCount,
        itemBuilder: (context, index) => ListTile(
          title: Text(items[index].title),
          subtitle: Text(items[index].body),
          onTap: () => chatNotificationService.remove(index),
        ),
      ),
    );
  }
}
