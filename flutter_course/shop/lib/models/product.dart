import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shop/utils/constants.dart';

class Product with ChangeNotifier {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.isFavorite = false,
  });

  void toggleFavorite(String token, String userId) async {
    _toggleFavorite();
    final response = await http.put(
      Uri.parse(
          '${Constants.userFavoritesBaseUrl}/$userId/$id.json?auth=$token'),
      body: jsonEncode(isFavorite),
    );
    if (response.statusCode != 200) {
      _toggleFavorite();
    }
  }

  void _toggleFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
