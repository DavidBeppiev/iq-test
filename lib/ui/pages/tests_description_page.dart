import 'package:flutter/material.dart';
import 'package:iq_tests/data/constants/strings.dart';
import 'package:iq_tests/data/constants/styles.dart';
import 'package:iq_tests/ui/pages/test_page.dart';
import 'package:iq_tests/ui/widgets/custom_button.dart';

class TestsDescriptionPage extends StatelessWidget {
  const TestsDescriptionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 25.0, right: 20.0, left: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: IconButton(
                              onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back))),
                      const Expanded(
                        flex: 5,
                        child: Text(
                          MyStrings.testTitle,
                          style: MyStyles.ts_FS30_FWbold_CText_LS7_FFPoiretOne,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.040,
                  ),
                  const Text(
                    MyStrings.testDescriptionText1,
                    style: MyStyles.ts_FS22_FWbold_CText_LS1_FFPoiretOne,
                  ),
                ],
              ),
              Column(
                children: [
                  const Text(
                    MyStrings.testDescriptionText2,
                    style: MyStyles.ts_FS18_FWbold_CDavys_Grey_LS1_FFPoiretOne,
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  customButton(
                      double.infinity,
                      MediaQuery.of(context).size.height * 0.090,
                      MyStrings.moveToTestText,
                      () =>
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const TestPage())))
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
