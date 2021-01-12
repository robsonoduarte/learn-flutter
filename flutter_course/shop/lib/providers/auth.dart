import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Auth with ChangeNotifier {
  static const _url =
      'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key= AIzaSyAwoqNX-Y0_NdQRfNk6vCMo3azmMcAYuzs';

  Future<void> signup(String email, String password) async {
    final response = await post(
      _url,
      body: json.encode({
        "email": email,
        "password": password,
        "returnSecureToken": true,
      }),
    );
    print(response.body);

    return Future.value();
  }
}
