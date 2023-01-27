import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_two/components/product_item.dart';

import '../models/product.dart';
import '../models/product_list.dart';

class ProductGrid extends StatelessWidget {
  final bool showFavoriteOnly;

  const ProductGrid({required this.showFavoriteOnly, super.key});

  @override
  Widget build(BuildContext context) {
    final List<Product> loadedProducts = showFavoriteOnly
        ? context.read<ProductList>().itemsFavorites
        : context.read<ProductList>().items;
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: loadedProducts.length,
      itemBuilder: (context, index) {
        return ChangeNotifierProvider.value(
          value: loadedProducts[index],
          child: ProductItem(),
        );
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
