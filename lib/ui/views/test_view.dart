import 'package:flutter/material.dart';
import 'package:iq_tests/bloc/tests%20cubit/test_cubit.dart';
import 'package:iq_tests/data/constants/styles.dart';
import 'package:iq_tests/data/models/tests_model.dart';

class TestView extends StatelessWidget {
  TestView(this.questions, {Key? key}) : super(key: key);

  Questions questions;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Text(
            questions.question!,
            style: MyStyles.ts_FS25_FWbold_CText_LS1_FFPoiretOne,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 100,),
          questions.explanation!.explanationText!.isEmpty
              ? Image.network(questions.explanation!.imagePath!)
              : SizedBox(
            height: 300.0,
                child: ListView.builder(
            itemCount: questions.explanation!.explanationText!.length,
                  itemBuilder: (context, i) {
                    return Text(
                      questions.explanation!.explanationText![i],
                      style: MyStyles.ts_FS35_FWbold_CText_LS7_FFPoiretOne,
                      textAlign: TextAlign.center,
                    );
                  }
                ),
              ),
        ],
      ),
    );
  }
}
