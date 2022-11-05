import 'package:flutter/material.dart';

class TestsResultPage extends StatelessWidget {
  int countRight;
  int countWrong;
  int result;
  Color testMeaningColor;
  String testMeaningText;

  TestsResultPage(
      {required this.countRight,
      required this.countWrong,
      required this.result,
      required this.testMeaningColor,
      required this.testMeaningText,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Right - $countRight'),
            Text('Wrong - $countWrong'),
            Text('Result - $result'),
            Text(testMeaningText, style: TextStyle(
              color: testMeaningColor,
            ),),
          ],
        ),
      ),
    );
  }
}
