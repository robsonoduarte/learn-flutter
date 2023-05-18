import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/product.dart';
import 'package:shop/utils/app_routes.dart';

import '../models/product_list.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  const ProductItem({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(product.imageUrl),
      ),
      title: Text(product.name),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(
              color: Theme.of(context).primaryColor,
              icon: const Icon(Icons.edit),
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.productForm,
                  arguments: product,
                );
              },
            ),
            IconButton(
              color: Theme.of(context).errorColor,
              icon: const Icon(Icons.delete),
              onPressed: () {
                showDialog<bool>(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Remove'),
                    content: const Text('Confirm ?'),
                    actions: [
                      TextButton(
                        child: const Text('No'),
                        onPressed: () => Navigator.of(context).pop(false),
                      ),
                      TextButton(
                        child: const Text('Yes'),
                        onPressed: () {
                          Navigator.of(context).pop(true);
                        },
                      )
                    ],
                  ),
                ).then((value) async {
                  if (value ?? false) {
                    try {
                      await context.read<ProductList>().remove(product);
                    } catch (error) {
                      print(error.toString());
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                          error.toString(),
                        ),
                      ));
                    }
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
