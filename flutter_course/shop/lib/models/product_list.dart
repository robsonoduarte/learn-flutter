import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shop/data/dummy_data.dart';
import 'package:shop/models/product.dart';

class ProductList with ChangeNotifier {
  final _url = 'https://shop-58107-default-rtdb.firebaseio.com';

  final List<Product> _items = dummyProducts;

  int get itemsCount => _items.length;
  List<Product> get items => [..._items];
  List<Product> get itemsFavorites =>
      _items.where((element) => element.isFavorite).toList();

  void save(Map<String, Object> data) {
    bool hasId = data['id'] != null;

    final product = Product(
      id: hasId ? data['id'] as String : Random().nextDouble().toString(),
      name: data['name'] as String,
      description: data['description'] as String,
      price: data['price'] as double,
      imageUrl: data['imageUrl'] as String,
    );

    if (hasId) {
      _update(product);
    } else {
      _save(product);
    }
  }

  void _update(Product product) {
    int index = _items.indexWhere((element) => element.id == product.id);
    if (index >= 0) {
      _items[index] = product;
      notifyListeners();
    }
  }

  void remove(Product product) {
    int index = _items.indexWhere((element) => element.id == product.id);
    if (index >= 0) {
      _items.removeWhere((element) => element.id == product.id);
      notifyListeners();
    }
  }

  void _save(Product product) async {
    var response = await http.post(
      Uri.parse("$_url/products.json"),
      body: jsonEncode(
        {
          "name": product.name,
          "description": product.description,
          "price": product.price,
          "imageUrl": product.imageUrl,
          "isFavorite": product.isFavorite
        },
      ),
    );

    print(response.statusCode);

    _items.add(product);
    notifyListeners();
  }
}
