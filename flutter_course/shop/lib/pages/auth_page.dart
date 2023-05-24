import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromRGBO(215, 177, 255, 0.6),
                  Color.fromRGBO(215, 118, 255, 0.9),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            child: Column(
              children: [
                Container(
                  child: const Text(
                    "Shop",
                    style: TextStyle(
                      fontSize: 45,
                      fontFamily: 'Anton',
                      //color: Theme.of(context).colorScheme.
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
