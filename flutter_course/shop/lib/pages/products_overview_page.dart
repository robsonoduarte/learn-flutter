import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/app_drawer.dart';
import 'package:shop/components/badge.dart';
import 'package:shop/utils/app_routes.dart';

import '../components/product_grid.dart';
import '../models/cart.dart';
import '../models/product_list.dart';

enum FilterOptions {
  favorites,
  all;
}

class ProductsOverviewPage extends StatefulWidget {
  const ProductsOverviewPage({super.key});
  @override
  State<ProductsOverviewPage> createState() => _ProductsOverviewPageState();
}

class _ProductsOverviewPageState extends State<ProductsOverviewPage> {
  bool _showFavoriteOnly = false;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    context.read<ProductList>().loadProducts().then((_) {
      setState(() {
        _isLoading = false;
      });
    });
  }

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
              setState(() {
                _showFavoriteOnly = option == FilterOptions.favorites;
              });
            },
          ),
          Badge(
            value: context.watch<Cart>().itemsCount.toString(),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.cart);
              },
              icon: const Icon(Icons.shopping_cart),
            ),
          )
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ProductGrid(showFavoriteOnly: _showFavoriteOnly),
      drawer: const AppDrawer(),
    );
  }
}
