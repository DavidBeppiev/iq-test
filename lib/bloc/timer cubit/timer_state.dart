part of 'timer_cubit.dart';

@immutable
abstract class TimerState {}

class TimerInitial extends TimerState {
  Duration? duration;
  TimerInitial({this.duration});
}
