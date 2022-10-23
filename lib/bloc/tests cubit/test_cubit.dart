import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:iq_tests/data/models/tests_model.dart';
import 'package:meta/meta.dart';

part 'test_state.dart';

class TestCubit extends Cubit<TestState> {
  TestCubit() : super(TestLoading());

  void loadTests() async {
    String data = await rootBundle.loadString("assets/tests/questions.json");
    TestsModel tests = TestsModel.fromJson(jsonDecode(data));
    emit(TestLoaded(tests: tests));
  }

}
