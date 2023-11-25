main() {
  // official dart documentation about built-in type:
  // https://dart.dev/language/built-in-types

  // Numbers
  // https://dart.dev/language/built-in-types#numbers
  // int
  var x = 1;
  var hex = 0xDEADBEEF;
  print(x);
  print(hex);
  //double
  var y = 1.1;
  var exponents = 1.42e5;
  print(y);
  print(exponents);
  // num
  num z = 1; // x can have both int and double values
  z += 2.5;
  print(z);

  // Boolean
  // https://dart.dev/language/built-in-types#booleans
  bool e = true;
  bool f = false;
  print(e || f);
  print(e && f);

  // dynamic
  dynamic g = "The value of PI is";
  dynamic h = 3.14;
  print("$g $h");
  // change the type dynamically
  g = 3.14;
  h = "The value of Pi is";
  print("$h $g");

  // String
  // https://dart.dev/language/built-in-types#strings
  String good = "Good";
  String day = "day";
  print("$good $day");

  // List
  // or List name = [...  (no inference)
  // https://dart.dev/language/collections#lists
  var name = ['Robson', 'Thiago', 'Ana Mara'];
  print(name.elementAt(1));
  print(name[1]);

  // Maps
  // https://dart.dev/language/collections#maps
  var phones = {
    'Robson': '11 940141644',
    'Thiago': '11 940141645',
    'Ana Mara': '11 940141647',
  };
  print(phones['Robson']);
  print(phones.values);
  print(phones.keys);

  // Set
  // https://dart.dev/language/collections#sets
  var countries = {'Brazil', 'Chile', 'USA'};
  print(countries.elementAt(1));
}
