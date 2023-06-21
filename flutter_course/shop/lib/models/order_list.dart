import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shop/models/cart.dart';
import 'package:shop/models/cart_item.dart';
import 'package:shop/utils/constants.dart';

import 'order.dart';

class OrderList with ChangeNotifier {
  final String _token;
  final String _userId;
  List<Order> _items = [];

  OrderList([this._token = '', this._userId = '', this._items = const []]);

  List<Order> get items {
    return [..._items];
  }

  int get itemsCount {
    return _items.length;
  }

  Future<void> addOrder(Cart cart) async {
    final date = DateTime.now();
    final response = await http.post(
      Uri.parse('${Constants.oderBaseUrl}/$_userId.json?auth=$_token'),
      body: jsonEncode(
        {
          'total': cart.total,
          'date': date.toIso8601String(),
          'products': cart.items.values
              .map(
                (cartItem) => {
                  'id': cartItem.id,
                  'productId': cartItem.productId,
                  'name': cartItem.name,
                  'quantity': cartItem.quantity,
                  'price': cartItem.price,
                },
              )
              .toList()
        },
      ),
    );
    _items.insert(
      0,
      Order(
        id: jsonDecode(response.body)['name'],
        total: cart.total,
        products: cart.items.values.toList(),
        date: date,
      ),
    );
    notifyListeners();
  }

  Future<void> loadOrders() async {
    List<Order> items = [];
    final response = await http
        .get(Uri.parse('${Constants.oderBaseUrl}/$_userId.json?auth=$_token'));
    if (response.body == 'null') return;
    Map<String, dynamic> data = jsonDecode(response.body);
    data.forEach((id, order) {
      items.add(Order(
          id: id,
          total: order['total'],
          products: (order['products'] as List<dynamic>).map((e) {
            return CartItem(
              e['id'],
              e['productId'],
              e['name'],
              e['quantity'],
              e['price'],
            );
          }).toList(),
          date: DateTime.parse(order['date'])));
    });
    _items = items.reversed.toList();
    notifyListeners();
  }
}
