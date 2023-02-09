import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_two/models/cart.dart';
import 'package:shop_two/models/order_list.dart';
import 'package:shop_two/models/product_list.dart';
import 'package:shop_two/pages/cart_page.dart';
import 'package:shop_two/pages/order_page.dart';
import 'package:shop_two/pages/product_detail_page.dart';
import 'package:shop_two/pages/products_overview_page.dart';
import 'package:shop_two/pages/products_page.dart';
import 'package:shop_two/utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductList()),
        ChangeNotifierProvider(create: (_) => Cart()),
        ChangeNotifierProvider(create: (_) => OrderList()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.purple,
            accentColor: Colors.deepOrange,
          ),
          fontFamily: 'Lato',
        ),
        //home: const ProductsOverviewPage(),
        routes: {
          AppRoutes.home: (context) => const ProductsOverviewPage(),
          AppRoutes.productDetail: (context) => const ProductDetailPage(),
          AppRoutes.cart: (context) => const CartPage(),
          AppRoutes.orders: (context) => const OrdersPage(),
          AppRoutes.products: (context) => const ProductsPage(),
        },
      ),
    );
  }
}
