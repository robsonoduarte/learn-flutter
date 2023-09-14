import 'package:chat/core/models/chat_notification.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';

class ChatNotificationService with ChangeNotifier {
  List<ChatNotification> _items = [];
  List<ChatNotification> get items => [..._items];
  int get itemsCount => _items.length;

  void add(ChatNotification chatNotification) {
    _items.add(chatNotification);
    notifyListeners();
  }

  void remove(int index) {
    _items.removeAt(index);
    notifyListeners();
  }

  Future<bool> get _isAuthorized async {
    final messaging = FirebaseMessaging.instance;
    final settings = await messaging.requestPermission();
    return settings.authorizationStatus == AuthorizationStatus.authorized;
  }

  Future<void> init() async {
    await _configureForeground();
  }

  Future<void> _configureForeground() async {
    if (await _isAuthorized) {
      FirebaseMessaging.onMessage.listen((message) {
        add(ChatNotification(
          message.notification!.title ?? 'Not Informed',
          message.notification!.body ?? 'Not Informed',
        ));
      });
    }
  }
}
