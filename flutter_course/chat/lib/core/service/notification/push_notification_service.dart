import 'package:chat/core/models/chat_notification.dart';
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
}
