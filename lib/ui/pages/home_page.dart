import 'package:flutter/material.dart';
import 'package:iq_tests/data/constants/colors.dart';
import 'package:iq_tests/data/constants/strings.dart';
import 'package:iq_tests/data/constants/styles.dart';
import 'package:iq_tests/ui/pages/tests_description_page.dart';
import 'package:iq_tests/ui/widgets/custom_button.dart';
import 'package:iq_tests/ui/widgets/my_logo_widget.dart';

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
                child: myLogoWidget(),
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
