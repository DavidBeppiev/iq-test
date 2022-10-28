import 'package:flutter/material.dart';
import 'package:iq_tests/data/constants/colors.dart';
import 'package:iq_tests/data/constants/strings.dart';
import 'package:iq_tests/data/constants/styles.dart';
import 'package:iq_tests/ui/pages/tests_description_page.dart';
import 'package:iq_tests/ui/widgets/custom_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/pi_logo.png',
                      width: 100.0,
                      color: MyColors.textColor,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          MyStrings.logoName1.toUpperCase(),
                          style: MyStyles.ts_FS35_FWbold_CText_LS7_FFPoiretOne,
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        const Text(
                          MyStrings.logoName2,
                          style: MyStyles.ts_FS35_FWbold_CText_LS20_FFPoiretOne,
                          textAlign: TextAlign.right,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: Column(
                  children: const [
                    Text(
                      MyStrings.descriptionText,
                      style: MyStyles.ts_FS20_FWbold_CText_LS1_FFPoiretOne,
                    ),
                  ],
                ),
              ),
              customButton(
                double.infinity,
                  60.0,
                  MyStrings.nextText,
                  () => Navigator.push(
                      context, MaterialPageRoute(builder: (context) => const TestsDescriptionPage()))),
            ],
          ),
        ),
      ),
    );
  }
}
