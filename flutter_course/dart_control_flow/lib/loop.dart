import 'dart:io';

main() {
  // Loops
  // https://dart.dev/language/loops

  // FOR
  // https://dart.dev/language/loops#for-loops
  var message = StringBuffer('Dart is fun');
  for (var i = 0; i < 5; i++) {
    message.write('!');
  }
  print(message);

  // Closures inside of Dart’s for loops capture the value of the index
  var callbacks = [];
  for (var i = 0; i < 2; i++) {
    callbacks.add(() => print(i));
  }

  for (final c in callbacks) {
    c();
  }

  // fon in
  const candidates = const ['Ana Mara', 'Robson', 'Antonio'];
  for (final candidate in candidates) {
    print('the candidate is $candidate');
  }

  // pattern in a for in
  final people = [
    Person('Robson', 47, 123),
    Person('Ana Mara', 48, 345),
    Person('Antonio', 73, 567),
  ];
  for (final Person(:name, :age) in people) {
    print("$name has $age");
  }

  // for each
  var collection = [1, 2, 3];
  collection.forEach(print);

  // while
  // https://dart.dev/language/loops#while-and-do-while

  var exit = false;
  while (!exit) {
    stdout.write("to exit type exit");
    exit = stdin.readLineSync()?.trim() == 'exit';
  }
}

class Person {
  final String name;
  final int age;
  final int document;

  Person(this.name, this.age, this.document);
}
