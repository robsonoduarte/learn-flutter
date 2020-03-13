
main(){
  // declare type of variable
  int i = 3;
  double d = 3.1;
  bool b = true;

  // define type of variable by inference
  var s = 'String';

  if(b){
    print(s);
  }

  // dynamic type :{ or :}
  dynamic dy = 'Test';
  dy = 1;
  dy = 2.0;
  print(dy);

  // Const and Final => https://stackoverflow.com/questions/50431055/what-is-the-difference-between-the-const-and-final-keywords-in-dart
  final f = 3;
  const c = 4;

  // List
  var names = ['Robson', 'Ana Mara'];
  names.add('Antonio');
  print(names.length);
  print(names.elementAt(0));

  // Set
  //Set<int> numbers = {0,1,2,3,4,4,4,4} without inference
  var numbers = {0,1,2,3,4,4,4,4};
  print(numbers.length);
  print(numbers is Set);

  // Map
  var scores = {
    'GOOGLE': 1.0,
    'AWS': 2.0,
    'APPLE': 3.0
  };

  // Function Style with Lambda and String Interpolation :}
  scores.forEach((k, v) => print('${k}: ${v}'));
}