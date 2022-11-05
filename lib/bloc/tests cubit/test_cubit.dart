import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iq_tests/data/models/test_result_model.dart';
import 'package:iq_tests/data/models/tests_model.dart';
import 'package:meta/meta.dart';

part 'test_state.dart';

class TestCubit extends Cubit<TestState> {
  TestCubit() : super(TestsLoading());

  TestsModel tests = TestsModel();

  int countRight = 0;
  int countWrong = 0;
  int iqResult = 0;

  TestMeaningModel testMeaning = TestMeaningModel();

  Color testMeaningColor = Colors.black;
  String testMeaningText = '';

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
      if (tests.data![0].questions![i].userAnswer == tests.data![0].questions![i].answer) countRight++;
      else countWrong++;
    }

    iqResult = countRight * 100 ~/ 15;

    meaningFun();

    emit(TestsResult(
        countRight: countRight,
        countWrong: countWrong,
        result: iqResult,
        testMeaningColor: testMeaningColor,
        testMeaningText: testMeaningText));
  }

  void meaningFun() {
    if (iqResult <= 69) {
      testMeaningText = testMeaning.resultText![0];
      testMeaningColor = testMeaning.resultColors![0];
    } else if (iqResult >= 70 && iqResult <= 79) {
      testMeaningText = testMeaning.resultText![1];
      testMeaningColor = testMeaning.resultColors![1];
    } else if (iqResult >= 80 && iqResult <= 99) {
      testMeaningText = testMeaning.resultText![2];
      testMeaningColor = testMeaning.resultColors![2];
    } else if (iqResult >= 100 && iqResult <= 114) {
      testMeaningText = testMeaning.resultText![3];
      testMeaningColor = testMeaning.resultColors![3];
    } else if (iqResult >= 115 && iqResult <= 130) {
      testMeaningText = testMeaning.resultText![4];
      testMeaningColor = testMeaning.resultColors![3];
    } else {
      testMeaningText = testMeaning.resultText![5];
      testMeaningColor = testMeaning.resultColors![3];
    }
  }
}
