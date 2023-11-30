main() {
  // Generics
  // https://dart.dev/language/generic

  // Using Collection literals
  // https://dart.dev/language/generics#using-collection-literals
  var names = <String>['Seth', 'Kathy', 'Lars']; // LIST
  var uniqueNames = <String>{'Seth', 'Kathy', 'Lars'}; // SET
  var pages = <String, String>{
    'index.html': 'Homepage',
    'robots.txt': 'Hints for web robots',
    'humans.txt': 'We are people, not machines'
  }; // MAP

  print(names.runtimeType);
  print(uniqueNames.runtimeType);
  print(pages.runtimeType);
  // Using parameterized types with constructors
  // https://dart.dev/language/generics#using-parameterized-types-with-constructors

  var nameSet = Set<String>.from(names);
  print(nameSet);

  // Generic collections and the types they contain
  // https://dart.dev/language/generics#generic-collections-and-the-types-they-contain
  print(names is List<String>);
}
