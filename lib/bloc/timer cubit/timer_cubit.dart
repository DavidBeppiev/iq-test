import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'timer_state.dart';

class TimerCubit extends Cubit<TimerState> {
  TimerCubit() : super(TimerInitial());

  Timer? countdownTimer;
  // Duration myDuration = const Duration(seconds: 2);
  Duration myDuration = const Duration(minutes: 30);

  void startTimer() {
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
    emit(TimerInitial(duration: myDuration));
  }

  void stopTimer() {
    countdownTimer?.cancel();
    emit(TimerInitial(duration: myDuration));
  }

  void resetTimer() {
    stopTimer();
    myDuration = const Duration(minutes: 30);
    emit(TimerInitial(duration: myDuration));
  }

  void setCountDown() {
    const reduceSecondsBy = 1;
    final seconds = myDuration.inSeconds - reduceSecondsBy;
    if (seconds < 0) {
      countdownTimer!.cancel();
      emit(TimerFinish());
    } else {
      myDuration = Duration(seconds: seconds);
      emit(TimerInitial(duration: myDuration));
    }
  }
}
