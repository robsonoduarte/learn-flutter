import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shop/data/store.dart';
import 'package:shop/exceptions/firebase_exception.dart';

class Auth with ChangeNotifier {
  static const _url = 'https://identitytoolkit.googleapis.com/v1/accounts:';

  final _apiKey = 'YOUR_API_KEY';
  String _token;
  DateTime _expiryTokenDate;

  bool get isAuth {
    return token != null;
  }

  String get token {
    if (_token != null &&
        _expiryTokenDate != null &&
        _expiryTokenDate.isAfter(DateTime.now())) {
      return _token;
    }
    return null;
  }

  Future<void> signIn(String email, String password) async {
    final response = await post(
      '${_url}signInWithPassword?key=$_apiKey',
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

    _token = responseBody['idToken'];
    _expiryTokenDate = DateTime.now()
        .add(Duration(seconds: int.parse(responseBody['expiresIn'])));

    Store.saveMap("userDate", {"token": _token});

    notifyListeners();

    return Future.value();
  }

  Future<void> signUp(String email, String password) async {
    final response = await post(
      '${_url}signUp?key=$_apiKey',
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

    _token = responseBody['idToken'];
    _expiryTokenDate = DateTime.now()
        .add(Duration(seconds: int.parse(responseBody['expiresIn'])));

    notifyListeners();

    return Future.value();
  }

  void logout() {
    _token = null;
    _token = null;
    _expiryTokenDate = null;
    notifyListeners();
  }
}
