main() {
  // Operators
  // https://dart.dev/language/operators

  // Arithmetic
  // https://dart.dev/language/operators#arithmetic-operators
  print(2 + 3 == 5);
  print(2 - 3 == -1);
  print(2 * 3 == 6);
  print(5 / 2 == 2.5); // Result is a double
  print(5 ~/ 2 == 2); // Result is an int
  print(5 % 2 == 1); // Remainder
  print('5/2 = ${5 ~/ 2} r ${5 % 2}');

  int a;
  int b;
  a = 0;
  b = ++a; // Increment a before b gets its value.
  print(a == b); // 1 == 1

  a = 0;
  b = a++; // Increment a after b gets its value.
  print(a != b); // 1 != 0

  a = 0;
  b = --a; // Decrement a before b gets its value.
  print(a == b); // -1 == -1

  a = 0;
  b = a--; // Decrement a after b gets its value.
  print(a != b); // -1 != 0

  // Logical operators
  // https://dart.dev/language/operators#logical-operators
  const done = false;
  var col = 0;
  if (!done && (col == 0 || col == 3)) {
    print('...Do something...');
  }

  //Assignment operators
  // https://dart.dev/language/operators#assignment-operators
  var c = 2; // Assign using =
  c *= 3; // Assign and multiply: a = a * 3
  print(c == 6);

  //Equality and relational operators
  //https://dart.dev/language/operators#equality-and-relational-operators
  print(2 == 2);
  print(2 != 3);
  print(3 > 2);
  print(2 < 3);
  print(3 >= 3);
  print(2 <= 3);

  //Bitwise and shift operators
  // https://dart.dev/language/operators#bitwise-and-shift-operators
  // 101 = 5
  // 100 = 4
  // 100 = 5
  print(5 & 4);

  //Conditional expressions
  //https://dart.dev/language/operators#conditional-expressions

  const isPublic = true;
  var visibility = isPublic ? 'public' : 'private';
  print(visibility);
}
