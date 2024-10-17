import 'package:flutter/material.dart';
import 'package:implicit_animations/fade_in.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Implicit Animations',
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              child: const Text(
                'FadeIn',
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FadeIn(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
