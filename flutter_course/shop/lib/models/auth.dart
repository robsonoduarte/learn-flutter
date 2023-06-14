import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  Future<void> signup(String email, String password) async {
    await _authenticate(email, password, 'signUp');
  }

  Future<void> login(String email, String password) async {
    await _authenticate(email, password, 'signInWithPassword');
  }

  Future<void> _authenticate(
      String email, String password, String urlAction) async {
    final uri =
        "https://identitytoolkit.googleapis.com/v1/accounts:$urlAction?key=AIzaSyCiyL7bHcgUvhMEl9PormwNU43tlGhiLSk";
    final response = await http.post(
      Uri.parse(uri),
      body: jsonEncode(
        {
          'email': email,
          'password': password,
          'returnSecureToken': true,
        },
      ),
    );
    print(response.statusCode);
    print(response.body);
  }
}
