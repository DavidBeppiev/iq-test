import 'package:flutter/material.dart';

class TestsResultPage extends StatelessWidget {
  int countRight;
  int countWrong;
  TestsResultPage({required this.countRight, required this.countWrong, Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Right - $countRight'),
            Text('Wrong - $countWrong'),
          ],
        ),
      ),
    );
  }

}
