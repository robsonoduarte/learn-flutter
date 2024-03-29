import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shop/exceptions/http_exception.dart';
import 'package:shop/models/product.dart';
import 'package:shop/utils/constants.dart';

class ProductList with ChangeNotifier {
  final String _token;
  final String _userId;
  List<Product> _items = [];

  ProductList([this._token = '', this._userId = '', this._items = const []]);

  int get itemsCount => _items.length;
  List<Product> get items => [..._items];
  List<Product> get itemsFavorites =>
      _items.where((element) => element.isFavorite).toList();

  Future<void> loadProducts() async {
    _items.clear();
    final response = await http
        .get(Uri.parse('${Constants.productBaseUrl}.json?auth=$_token'));
    if (response.body == 'null') return;

    final favResponse = await http.get(
      Uri.parse('${Constants.userFavoritesBaseUrl}/$_userId.json?auth=$_token'),
    );

    Map<String, dynamic> favData =
        favResponse.body == 'null' ? {} : jsonDecode(favResponse.body);

    Map<String, dynamic> data = jsonDecode(response.body);
    data.forEach((id, product) {
      final isFavorite = favData[id] ?? false;
      _items.add(
        Product(
          id: id,
          name: product['name'],
          description: product['description'],
          price: product['price'],
          imageUrl: product['imageUrl'],
          isFavorite: isFavorite,
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
      await http.patch(
        Uri.parse(
            '${Constants.productBaseUrl}/${product.id}.json?auth=$_token'),
        body: jsonEncode(
          {
            "name": product.name,
            "description": product.description,
            "price": product.price,
            "imageUrl": product.imageUrl
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
        Uri.parse(
            '${Constants.productBaseUrl}/${product.id}.json?auth=$_token'),
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
      Uri.parse('${Constants.productBaseUrl}.json?auth=$_token'
          ''),
      body: jsonEncode(
        {
          "name": product.name,
          "description": product.description,
          "price": product.price,
          "imageUrl": product.imageUrl,
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
