import 'package:flutter/material.dart';

class MineFieldApp extends StatelessWidget {
  const MineFieldApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Minefield'),
        ),
        body: Container(
          child: Text('Board'),
        ),
      ),
    );
  }
}
