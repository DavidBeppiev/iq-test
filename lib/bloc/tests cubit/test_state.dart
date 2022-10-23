part of 'test_cubit.dart';

@immutable
abstract class TestState {}

class TestLoading extends TestState {}

class TestLoaded extends TestState {
  TestsModel tests;
  TestLoaded({required this.tests});
}