part of 'test_cubit.dart';

@immutable
abstract class TestState {}

// enum TestMeaning {
//   veryLow,
//   quiteLow,
//   middle,
//   good,
//   high,
//   veryHigh
// }

class TestsLoading extends TestState {}

class TestsLoaded extends TestState {
  TestsModel tests;

  TestsLoaded({required this.tests});
}

class TestsResult extends TestState {
  int countRight;
  int countWrong;
  int result;
  Color testMeaningColor;
  String testMeaningText;

  // TestMeaning meaning;

  TestsResult(
      {required this.countRight,
      required this.countWrong,
      required this.result,
      required this.testMeaningColor,
      required this.testMeaningText});
}
