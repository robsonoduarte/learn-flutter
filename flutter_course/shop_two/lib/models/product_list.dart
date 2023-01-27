import 'package:flutter/cupertino.dart';
import 'package:shop_two/data/dummy_data.dart';
import 'package:shop_two/models/product.dart';

class ProductList with ChangeNotifier {
  final List<Product> _items = dummyProducts;

  List<Product> get items => [..._items];
  List<Product> get itemsFavorites =>
      _items.where((element) => element.isFavorite).toList();

  void addProduct(Product product) {
    _items.add(product);
    notifyListeners();
  }
}
