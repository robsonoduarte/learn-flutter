
// function with dynamic parameters
add(a, b) { // the void key word is implicit
  print(a + b);
}

// function with typed parameters
subtract(int a, int b) {
  print(a - b);
}

// function with return
double divide(int a, int b) {
  return a / b;
}

// function with function as parameters
exec(a, b,Function(int,int)f){
 print(f(a,b));
}

multiply(a,b) => a * b; // Anonymous Function

// Class
class Person{
  String name;
  int age;
}


main() {
  add(1, 2);
  subtract(2, 4);
  print("Result is => ${divide(4, 2)}"); //String interpolation with one function
  exec(2, 3, multiply);

  var p = new Person();
  p.name = 'Robson';
  p.age = 43;

  print("The age of ${p.name} is ${p.age}");
}