# pomodoro app

The main concept studied in this app is use [Mobx](https://pub.dev/packages/mobx) as alternative Flutter built in stage manager.

### [the Mobx Store](https://github.com/robsonoduarte/learn-flutter/blob/3af34adce853ca0b03b1fb538e9a9ecf74e29f8e/flutter_course/pomodoro/lib/store/pomodoro.store.dart#L11):
![image](https://github.com/robsonoduarte/learn-flutter/assets/797845/935aa633-4ad0-438c-a052-9f8dc9e328e2)

### [using the Store](https://github.com/robsonoduarte/learn-flutter/blob/3af34adce853ca0b03b1fb538e9a9ecf74e29f8e/flutter_course/pomodoro/lib/components/stopwatch.dart#L12):
![image](https://github.com/robsonoduarte/learn-flutter/assets/797845/5a918b5d-179a-414b-8f9b-f2329313dbe8)

### to generate the g.dart code:
```
flutter pub run build_runner watch --delete-conflicting-outputs
```

### to run:
```
flutter run
```





