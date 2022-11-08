import 'package:flutter/material.dart';
import 'package:iq_tests/data/constants/colors.dart';
import 'package:iq_tests/data/constants/strings.dart';
import 'package:iq_tests/data/constants/styles.dart';
import 'package:iq_tests/ui/pages/home_page.dart';
import 'package:iq_tests/ui/widgets/my_logo_widget.dart';

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
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushAndRemoveUntil(
            context, MaterialPageRoute(builder: (context) => const HomePage()), (Route<dynamic> route) => false);
        return true;
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: myLogoWidget(),
              ),
              const SizedBox(
                height: 25.0,
              ),
              Text(
                '${MyStrings.resultTestText} $result ${MyStrings.logoName1.toUpperCase()}',
                style: MyStyles.ts_FS20_FWbold_CText_LS1_FFPoiretOne,
              ),
              const SizedBox(height: 7.0,),
              Center(
                child: Text(
                  testMeaningText,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 27.0,
                      color: testMeaningColor,
                      fontFamily: 'PoiretOne'),
                ),
              ),
              const Expanded(
                child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                      child: Text(
                  MyStrings.topInformationText,
                  style: MyStyles.ts_FS20_FWbold_CText_LS1_FFPoiretOne,
                  textAlign: TextAlign.center,
                ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
