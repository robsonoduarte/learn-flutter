import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_two/components/cart_item.dart';
import 'package:shop_two/models/cart.dart';
import 'package:shop_two/models/order_list.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var items = context.read<Cart>().items.values.toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 25,
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Chip(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    label: Text(
                      'R\$ ${context.watch<Cart>().total.toStringAsFixed(2)}',
                      style: TextStyle(
                        color:
                            Theme.of(context).primaryTextTheme.headline6?.color,
                      ),
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    onPressed: () {
                      context.read<OrderList>().addOrder(
                            context.read<Cart>(),
                          );
                      context.read<Cart>().clear();
                    },
                    child: const Text('Compar'),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) => CartItemWidget(
                cartItem: items[index],
              ),
            ),
          )
        ],
      ),
    );
  }
}
