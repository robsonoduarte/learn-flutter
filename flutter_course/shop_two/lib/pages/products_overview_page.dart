import 'package:flutter/material.dart';
import 'package:shop_two/components/product_item.dart';
import 'package:shop_two/data/dummy_data.dart';
import 'package:shop_two/models/product.dart';

class ProductsOverviewPage extends StatelessWidget {
  final List<Product> loadedProducts = dummyProducts;
  ProductsOverviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minha loja'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: loadedProducts.length,
        itemBuilder: (context, index) {
          return ProductItem(product: loadedProducts[index]);
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
      ),
    );
  }
}
