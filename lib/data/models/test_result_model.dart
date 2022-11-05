import 'package:flutter/material.dart';
import 'package:iq_tests/data/constants/strings.dart';

class TestMeaningModel {

  List<Color> resultColors = [
    Colors.red,
    Colors.brown,
    Colors.yellow,
    Colors.green
  ];

  List<String> resultText = [
    MyStrings.veryLow,
    MyStrings.quiteLow,
    MyStrings.middle,
    MyStrings.good,
    MyStrings.high,
    MyStrings.veryHigh,
  ];

  // TestMeaningModel({this.resultColors = [], this.resultText});
}