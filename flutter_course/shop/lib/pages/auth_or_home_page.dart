import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/auth.dart';
import 'package:shop/pages/products_overview_page.dart';

import 'auth_page.dart';

class AuthOrHome extends StatelessWidget {
  const AuthOrHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: context.watch<Auth>().tryAutoLogin(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.error != null) {
          return const Center(
            child: Text('deu :pop:'),
          );
        } else {
          return context.watch<Auth>().isAuth
              ? const ProductsOverviewPage()
              : const AuthPage();
        }
      },
    );
  }
}
