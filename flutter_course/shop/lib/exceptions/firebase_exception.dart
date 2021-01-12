class AuthException implements Exception {
  static const Map<String, String> errors = {
    'EMAIL_EXISTS': 'The email address is already in use by another account',
    'OPERATION_NOT_ALLOWED': 'Password sign-in is disabled for this project',
    'TOO_MANY_ATTEMPTS_TRY_LATER':
        'We have blocked all requests from this device due to unusual activity',
    'EMAIL_NOT_FOUND':
        'There is no user record corresponding to this identifier',
    'INVALID_PASSWORD':
        'The password is invalid or the user does not have a password',
    'USER_DISABLED': 'The user account has been disabled by an administrator'
  };

  final String key;
  const AuthException(this.key);

  @override
  String toString() {
    return errors[key] ?? 'Panic...';
  }
}
