import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_two/models/product_list.dart';

import '../components/product_grid.dart';

enum FilterOptions {
  favorites,
  all;
}

class ProductsOverviewPage extends StatelessWidget {
  const ProductsOverviewPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minha loja'),
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            itemBuilder: (_) => [
              const PopupMenuItem(
                value: FilterOptions.favorites,
                child: Text('Somente Favoritos'),
              ),
              const PopupMenuItem(
                value: FilterOptions.all,
                child: Text('Todos'),
              )
            ],
            onSelected: (FilterOptions option) {
              if (option == FilterOptions.favorites) {
                context.read<ProductList>().showFavoriteOnly();
              } else {
                context.read<ProductList>().showAll();
              }
            },
          ),
        ],
      ),
      body: const ProductGrid(),
    );
  }
}
