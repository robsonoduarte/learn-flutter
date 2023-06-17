import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/auth.dart';
import 'package:shop/pages/auth_page.dart';
import 'package:shop/pages/products_overview_page.dart';

class AuthOrHome extends StatelessWidget {
  const AuthOrHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return context.watch<Auth>().isAuth
        ? const ProductsOverviewPage()
        : const AuthPage();
  }
}
