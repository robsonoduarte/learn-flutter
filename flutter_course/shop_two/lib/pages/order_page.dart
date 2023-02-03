import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_two/components/app_drawer.dart';
import 'package:shop_two/components/order.dart';
import 'package:shop_two/models/order_list.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orders = context.read<OrderList>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Meus Pedidos'),
      ),
      drawer: const AppDrawer(),
      body: ListView.builder(
        itemCount: orders.itemsCount,
        itemBuilder: (context, index) => OrderWidget(
          order: orders.items[index],
        ),
      ),
    );
  }
}
