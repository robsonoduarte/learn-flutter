import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shop/exceptions/http_exception.dart';
import 'package:shop/models/product.dart';

class ProductList with ChangeNotifier {
  final _baseUrl = 'https://shop-71f09-default-rtdb.firebaseio.com/products';

  final List<Product> _items = [];

  int get itemsCount => _items.length;
  List<Product> get items => [..._items];
  List<Product> get itemsFavorites =>
      _items.where((element) => element.isFavorite).toList();

  Future<void> loadProducts() async {
    _items.clear();
    final response = await http.get(Uri.parse('$_baseUrl.json'));
    if (response.body == 'null') return;
    Map<String, dynamic> data = jsonDecode(response.body);
    data.forEach((id, product) {
      _items.add(
        Product(
          id: id,
          name: product['name'],
          description: product['description'],
          price: product['price'],
          imageUrl: product['imageUrl'],
          isFavorite: product['isFavorite'],
        ),
      );
    });
    notifyListeners();
  }

  Future<void> save(Map<String, Object> data) async {
    bool hasId = data['id'] != null;
    final product = Product(
      id: hasId ? data['id'] as String : Random().nextDouble().toString(),
      name: data['name'] as String,
      description: data['description'] as String,
      price: data['price'] as double,
      imageUrl: data['imageUrl'] as String,
    );
    if (hasId) {
      await _update(product);
    } else {
      await _save(product);
    }
  }

  Future<void> _update(Product product) async {
    int index = _items.indexWhere((element) => element.id == product.id);
    if (index >= 0) {
      await http.post(
        Uri.parse('$_baseUrl/${product.id}.json'),
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
      _items[index] = product;
      notifyListeners();
    }
  }

  Future<void> remove(Product product) async {
    int index = _items.indexWhere((element) => element.id == product.id);
    if (index >= 0) {
      _items.removeAt(index);
      notifyListeners();
      final response = await http.delete(
        Uri.parse('$_baseUrl/${product.id}.json'),
      );
      if (response.statusCode != 200) {
        _items.insert(index, product);
        notifyListeners();
        throw HttpException(
          'Error when delete product',
          response.statusCode,
        );
      }
    }
  }

  _save(Product product) async {
    final response = await http.post(
      Uri.parse('$_baseUrl.json'),
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
    _items.add(
      Product(
        id: jsonDecode(response.body)['name'],
        name: product.name,
        description: product.description,
        price: product.price,
        imageUrl: product.imageUrl,
      ),
    );
    notifyListeners();
  }
}
