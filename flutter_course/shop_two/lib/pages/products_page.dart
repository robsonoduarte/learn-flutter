import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_two/components/app_drawer.dart';
import 'package:shop_two/components/product_item.dart';
import 'package:shop_two/models/product_list.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productList = context.read<ProductList>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gerenciar Produtos'),
      ),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: productList.itemsCount,
          itemBuilder: (context, index) => Column(
            children: [
              ProductItem(product: productList.items[index]),
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
