import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum AuthMode { Signup, Login }

class AuthCard extends StatefulWidget {
  @override
  _AuthCardState createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard> {
  var _authMode = AuthMode.Login;
  final _passwordController = TextEditingController();
  var _authData = {'email': '', 'password': ''};

  void _submit() {}

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 8,
      child: Container(
        height: 320,
        width: deviceSize.width * 0.75,
        margin: EdgeInsets.only(bottom: 20.0),
        padding: EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'e-mail'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value.isEmpty || !value.contains('@')) {
                    return "email is not valid";
                  }
                  return null;
                },
                onSaved: (value) => _authData['email'] = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'password'),
                controller: _passwordController,
                obscureText: true,
                validator: (value) {
                  if (value.isEmpty || value.length > 5) {
                    return "password no valid";
                  }
                  return null;
                },
                onSaved: (value) => _authData['password'] = value,
              ),
              if (_authMode == AuthMode.Signup)
                TextFormField(
                  decoration: InputDecoration(labelText: 'password confirm'),
                  controller: _passwordController,
                  obscureText: true,
                  validator: _authMode == AuthMode.Signup
                      ? (value) {
                          if (value.isEmpty != _passwordController.text) {
                            return "password not match";
                          }
                          return null;
                        }
                      : null,
                  onSaved: (value) => _authData['password'] = value,
                ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                color: Theme.of(context).primaryColor,
                textColor: Theme.of(context).primaryTextTheme.button.color,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                child: Text(
                  _authMode == AuthMode.Login ? 'Login' : 'Signup',
                ),
                onPressed: _submit,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
