import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shop/models/cart_item.dart';
import 'package:shop/models/product.dart';

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items => {..._items};
  int get itemsCount => _items.length;
  double get total {
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

  void removeSingleItem(String productId) {
    if (!_items.containsKey(productId)) return;
    if (_items[productId]?.quantity == 1) {
      _items.remove(productId);
    } else {
      _items.update(
          productId,
          (cartItem) => CartItem(
                cartItem.id,
                cartItem.productId,
                cartItem.name,
                cartItem.quantity - 1,
                cartItem.price,
              ));
    }
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
