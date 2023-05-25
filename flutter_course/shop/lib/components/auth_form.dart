import 'package:flutter/material.dart';

enum AuthMode {
  signup,
  login,
}

class AuthForm extends StatefulWidget {
  const AuthForm({super.key});
  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _passwordController = TextEditingController();
  AuthMode _authMode = AuthMode.login;

  Map<String, String> _authData = {
    'email': '',
    'password': ',',
  };

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        height: 320,
        width: screenSize.width * 0.75,
        padding: const EdgeInsets.all(16),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'E-mail',
                ),
                keyboardType: TextInputType.emailAddress,
                onSaved: (value) {
                  _authData['email'] = value ?? '';
                },
                validator: (value) {
                  final email = value ?? '';
                  if (email.trim().isEmpty || email.contains('@')) {
                    return 'informe um email valido';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Senha',
                ),
                keyboardType: TextInputType.emailAddress,
                obscureText: true,
                onSaved: (value) {
                  _authData['senha'] = value ?? '';
                },
                validator: (value) {
                  final _password = value ?? '';
                  if (_password.trim().isEmpty || _password.length < 5) {
                    return 'Informe uma senha valida';
                  }
                  return null;
                },
              ),
              if (_authMode == AuthMode.signup)
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Confimar Senah',
                  ),
                  keyboardType: TextInputType.emailAddress,
                  obscureText: true,
                  validator: _authMode == AuthMode.login
                      ? null
                      : (value) {
                          final password = value ?? '';
                          if (password != _passwordController.text) {
                            return 'senhas não conferem';
                          }
                          return null;
                        },
                ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: _submit,
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 8,
                    )),
                child: Text(
                  _authMode == AuthMode.login ? 'Entrar' : "Registrar",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _submit() {}
}
