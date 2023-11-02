import 'package:mobx/mobx.dart';

part 'pomodoro.store.g.dart';

class PomodoroStore = _PomodoroStore with _$PomodoroStore;

enum RangeType { work, rest }

abstract class _PomodoroStore with Store {
  @observable
  bool started = false;
  @observable
  int minutes = 2;
  @observable
  int seconds = 0;
  @observable
  int workTime = 2;
  @observable
  int restTime = 1;
  @observable
  RangeType rangeType = RangeType.rest;

  @action
  void start() {
    started = true;
  }

  @action
  void stop() {
    started = false;
  }

  @action
  void restart() {
    started = false;
  }

  @action
  void incWorkTime() {
    workTime++;
  }

  @action
  void decWorkTime() {
    workTime--;
  }

  @action
  void incRestTime() {
    restTime++;
  }

  @action
  void decRestTime() {
    restTime--;
  }

  bool isWork() {
    return rangeType == RangeType.work;
  }

  bool isRest() {
    return rangeType == RangeType.rest;
  }
}
