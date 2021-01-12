import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shop/exceptions/firebase_exception.dart';

class Auth with ChangeNotifier {
  static const _url = 'https://identitytoolkit.googleapis.com/v1/accounts:';

  Future<void> signin(String email, String password) async {
    final response = await post(
      '${_url}signInWithPassword?key=',
      body: json.encode({
        "email": email,
        "password": password,
        "returnSecureToken": true,
      }),
    );

    final responseBody = json.decode(response.body);

    if (responseBody['error'] != null) {
      throw AuthException(responseBody['error']['message']);
    }

    return Future.value();
  }

  Future<void> signup(String email, String password) async {
    final response = await post(
      '${_url}signUp?key=',
      body: json.encode({
        "email": email,
        "password": password,
        "returnSecureToken": true,
      }),
    );

    final responseBody = json.decode(response.body);

    if (responseBody['error'] != null) {
      throw AuthException(responseBody['error']['message']);
    }

    return Future.value();
  }
}
