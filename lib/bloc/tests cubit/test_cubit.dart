import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:iq_tests/data/models/tests_model.dart';
import 'package:meta/meta.dart';

part 'test_state.dart';

class TestCubit extends Cubit<TestState> {
  TestCubit() : super(TestsLoading());

  TestsModel tests = TestsModel();

  int countRight = 0;
  int countWrong = 0;

  void loadTests() async {
    emit(TestsLoading());
    String data = await rootBundle.loadString("assets/tests/questions.json");
    tests = TestsModel.fromJson(jsonDecode(data));
    emit(TestsLoaded(tests: tests));
  }

  void userAnswer(String answer, int id) => tests.data![0].questions![id].userAnswer = answer;

  void calculateResult() {
    emit(TestsLoading());
    for (int i = 0; i < tests.data![0].questions!.length; i++) {
      if (tests.data![0].questions![i].userAnswer == tests.data![0].questions![i].answer) {
        countRight++;
      } else {
        countWrong++;
      }
    }
    emit(TestsResult(countRight: countRight, countWrong: countWrong));
  }
}
