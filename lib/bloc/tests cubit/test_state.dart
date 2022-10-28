part of 'test_cubit.dart';

@immutable
abstract class TestState {}

class TestsLoading extends TestState {}

class TestsLoaded extends TestState {
  TestsModel tests;
  TestsLoaded({required this.tests});
}