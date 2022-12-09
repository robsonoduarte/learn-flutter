import 'package:flutter/material.dart';
import 'package:shop_two/pages/product_detail_page.dart';
import 'package:shop_two/pages/products_overview_page.dart';
import 'package:shop_two/utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
        ),
        fontFamily: 'Lato',
      ),
      home: ProductsOverviewPage(),
      routes: {AppRoutes.productDetail: (context) => const ProductDetailPage()},
    );
  }
}
