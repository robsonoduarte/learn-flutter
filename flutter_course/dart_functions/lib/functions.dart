main() {
  // Functions
  // https://dart.dev/language/functions

  // using the dynamic as parameters :eyes:
  union(a, b) {
    print(a + b);
  }

  union(2.8, 47);

  // Named parameters
  // https://dart.dev/language/functions#named-parameters
  String named({String name = 'Robson', int age = 47}) {
    return '$name has age';
  }

  print(named()); // using default parameters
  print(named(age: 48, name: 'Ana Mara')); // using named parameters

  // Optional positional parameters
  // https://dart.dev/language/functions#optional-positional-parameters
  String say(String from, String msg, [String? device]) {
    var result = '$from says $msg';
    if (device != null) {
      result = '$result with a $device';
    }
    return result;
  }

  print(say("Robson", "Hello Dart and Flutter"));
  print(say("Robson", "Hello Dart and Flutter", 'Android'));

  // Functions as first-class objects
  // https://dart.dev/language/functions#functions-as-first-class-objects

  // function as var
  final sum = (int a, int b) => a + b;
  print(sum);
  print(sum(10, 30));

  // function as param
  var result = [1, 2, 3].fold(1, sum);
  print(result);
}
