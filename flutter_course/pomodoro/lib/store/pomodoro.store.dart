import 'dart:async';

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
  RangeType rangeType = RangeType.work;

  Timer? stopwatch;

  @action
  void start() {
    started = true;
    stopwatch = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (minutes == 0 && seconds == 0) {
        _changeTypeInterval();
      } else if (seconds == 0) {
        seconds = 59;
        minutes--;
      } else {
        seconds--;
      }
    });
  }

  @action
  void stop() {
    started = false;
    stopwatch?.cancel();
  }

  @action
  void restart() {
    started = false;
    stop();
    minutes = isWork() ? workTime : restTime;
    seconds = 0;
  }

  @action
  void incWorkTime() {
    workTime++;
    if (isWork()) {
      restart();
    }
  }

  @action
  void decWorkTime() {
    if (workTime > 1) {
      workTime--;
      if (isWork()) {
        restart();
      }
    }
  }

  @action
  void incRestTime() {
    restTime++;
    if (isRest()) {
      restart();
    }
  }

  @action
  void decRestTime() {
    if (restTime > 1) {
      restTime--;
      if (isRest()) {
        restart();
      }
    }
  }

  bool isWork() {
    return rangeType == RangeType.work;
  }

  bool isRest() {
    return rangeType == RangeType.rest;
  }

  void _changeTypeInterval() {
    if (isWork()) {
      rangeType = RangeType.rest;
      minutes = restTime;
    } else {
      rangeType = RangeType.work;
      minutes = workTime;
    }
    seconds = 0;
  }
}
