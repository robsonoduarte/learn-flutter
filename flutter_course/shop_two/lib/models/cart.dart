import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shop_two/models/cart_item.dart';
import 'package:shop_two/models/product.dart';

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  get items => {..._items};
  get itemsCount => _items.length;
  get total {
    double total = 0.0;
    _items.forEach((key, value) {
      total += value.price * value.quantity;
    });
    return total;
  }

  void addItem(Product product) {
    if (_items.containsKey(product.id)) {
      _items.update(
          product.id,
          (cartItem) => CartItem(
                cartItem.id,
                cartItem.productId,
                cartItem.name,
                cartItem.quantity + 1,
                cartItem.price,
              ));
    } else {
      _items.putIfAbsent(
          product.id,
          () => CartItem(
                Random().nextDouble().toString(),
                product.id,
                product.name,
                1,
                product.price,
              ));
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
