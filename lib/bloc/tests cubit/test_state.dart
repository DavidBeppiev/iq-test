part of 'test_cubit.dart';

@immutable
abstract class TestState {}

class TestsLoading extends TestState {}

class TestsLoaded extends TestState {
  TestsModel tests;
  TestsLoaded({required this.tests});
}

class TestsResult extends TestState {
  int countRight;
  int countWrong;
  TestsResult({required this.countRight, required this.countWrong});
}