main() {
  // the official Dart documentation variables
  // https://dart.dev/language/variables
  // about the type inference
  // https://dart.dev/language/type-system#type-inference

  //declaring the type
  int a = 2;
  double b = 3.1314;

  //using the keyword var for dart inferring the type
  var c = 2;
  var d = 3.1314;

  print(a + b);
  print(a + b);

  //checking the runtime type of variables inferred
  print(c.runtimeType);
  print(d.runtimeType);

  // other way to check type of the variables inferred
  print(c is int);
  print(c is String);
}
