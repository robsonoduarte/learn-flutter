import 'package:chat/pages/auth_or_app_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chant',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AuthOrAppPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
