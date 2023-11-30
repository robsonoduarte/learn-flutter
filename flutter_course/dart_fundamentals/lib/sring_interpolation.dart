main() {
  // String and interpolation
  //https://dart.dev/language/built-in-types#strings

  var s1 = 'Single quotes work well for string literals.';
  var s2 = "Double quotes work just as well.";
  var s3 = 'It\'s easy to escape the string delimiter.';
  var s4 = "It's even easier to use the other delimiter.";

  print(s1);
  print(s2);
  print(s3);
  print(s4);

  var s = 'string interpolation';

  print('Dart has $s, which is very handy.' ==
      'Dart has string interpolation, '
          'which is very handy.');
  print('That deserves all caps. '
          '${s.toUpperCase()} is very handy!' ==
      'That deserves all caps. '
          'STRING INTERPOLATION is very handy!');
}
