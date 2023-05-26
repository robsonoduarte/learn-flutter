import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  static const _uri =
      "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=[]";
  Future<void> signup(String email, String password) async {
    final response = await http.post(
      Uri.parse(_uri),
      body: jsonEncode(
        {
          'email': email,
          'password': password,
          'returnSecureToken': true,
        },
      ),
    );
    print(response.body);
  }
}
