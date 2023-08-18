import 'dart:io';

import 'package:chat/components/user_image_picker.dart';
import 'package:chat/models/auth_form_data.dart';
import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  final void Function(AuthFormData) onSubmit;
  const AuthForm({super.key, required this.onSubmit});
  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  final _authFormData = AuthFormData();

  void _submit() {
    final isValid = _formKey.currentState!.validate() ?? false;
    if (!isValid) return;
    if (_authFormData.image == null && _authFormData.isSignup) {
      return _showError('Image no selected');
    }
    widget.onSubmit(_authFormData);
  }

  void _handleImagePick(File image) {
    _authFormData.image = image;
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Theme.of(context).colorScheme.error,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Visibility(
                visible: _authFormData.isSignup,
                child: UserImagePicker(onImagePick: _handleImagePick),
              ),
              Visibility(
                visible: _authFormData.isSignup,
                child: TextFormField(
                  key: const ValueKey('name'),
                  initialValue: _authFormData.name,
                  onChanged: (name) => _authFormData.name = name,
                  decoration: const InputDecoration(
                    labelText: 'name',
                  ),
                  validator: (value) {
                    final name = value ?? '';
                    if (name.trim().length < 5) {
                      return 'name must be a least 5 characters';
                    }
                    return null;
                  },
                ),
              ),
              TextFormField(
                key: const ValueKey('email'),
                initialValue: _authFormData.email,
                onChanged: (email) => _authFormData.email = email,
                decoration: const InputDecoration(
                  labelText: 'e-mail',
                ),
                validator: (value) {
                  final email = value ?? '';
                  if (!email.contains('@')) {
                    return 'invalid email';
                  }
                  return null;
                },
              ),
              TextFormField(
                key: const ValueKey('password'),
                initialValue: _authFormData.password,
                onChanged: (password) => _authFormData.password = password,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'password',
                ),
                validator: (value) {
                  final password = value ?? '';
                  if (password.length < 5) {
                    return 'password must be a least 6 characters';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 12,
              ),
              ElevatedButton(
                onPressed: _submit,
                child: Text(_authFormData.isLogin ? 'login' : 'register'),
              ),
              TextButton(
                child: Text(
                  _authFormData.isLogin
                      ? 'create a new account ?'
                      : 'already have account ?',
                ),
                onPressed: () {
                  setState(() {
                    _authFormData.toggleAuthMode();
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
