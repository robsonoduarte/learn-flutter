import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shop/data/store.dart';
import 'package:shop/exceptions/auth_exception.dart';

class Auth with ChangeNotifier {
  String? _token;
  String? _email;
  String? _userId;
  DateTime? _expiryToken;
  Timer? _logoutTimer;

  bool get isAuth {
    return _token != null && (_expiryToken?.isAfter(DateTime.now()) ?? false);
  }

  String? get token {
    return isAuth ? _token : null;
  }

  String? get email {
    return isAuth ? _email : null;
  }

  String? get userId {
    return isAuth ? _userId : null;
  }

  Future<void> signup(String email, String password) async {
    return _authenticate(email, password, 'signUp');
  }

  Future<void> login(String email, String password) async {
    return _authenticate(email, password, 'signInWithPassword');
  }

  void logout() {
    _token = null;
    _email = null;
    _userId = null;
    _expiryToken = null;
    _clearLogoutTime();
    Store.remove("userData").then((_) => notifyListeners());
    ;
  }

  Future<void> tryAutoLogin() async {
    if (isAuth) return;
    final userData = await Store.getMap('userData');
    if (userData.isEmpty) return;
    final expiryDate = DateTime.parse(userData['expiryToken']);
    if (expiryDate.isBefore(DateTime.now())) return;

    _token = userData['token'];
    _email = userData['email'];
    _userId = userData['userId'];
    _expiryToken = expiryDate;
    _autoLogout();
    notifyListeners();
  }

  void _clearLogoutTime() {
    _logoutTimer?.cancel();
    _logoutTimer = null;
  }

  void _autoLogout() {
    _clearLogoutTime();
    _logoutTimer = Timer(
        Duration(
            seconds: _expiryToken?.difference(DateTime.now()).inSeconds ?? 0),
        logout);
  }

  Future<void> _authenticate(
      String email, String password, String urlAction) async {
    final uri =
        "https://identitytoolkit.googleapis.com/v1/accounts:$urlAction?key=FIREBASE_API_KEY";
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
    final body = jsonDecode(response.body);
    if (response.statusCode != 200) {
      throw AuthException(body['error']['message']);
    } else {
      _token = body['idToken'];
      _email = body['email'];
      _userId = body['localId'];
      _expiryToken = DateTime.now().add(
        Duration(
          seconds: int.parse(body['expiresIn']),
        ),
      );

      Store.saveMap("userData", {
        'token': _token,
        'email': _email,
        'userId': _userId,
        'expiryToken': _expiryToken!.toIso8601String(),
      });

      _autoLogout();
      notifyListeners();
    }
  }
}
