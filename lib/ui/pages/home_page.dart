import 'package:flutter/material.dart';
import 'package:iq_tests/data/constants/colors.dart';
import 'package:iq_tests/data/constants/strings.dart';
import 'package:iq_tests/data/constants/styles.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  // double logoTextWidth = 180.0;

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
                          style: MyStyles.ts_FS50_FWbold_CMain_LS7_FFPoiretOne,
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        const Text(
                          MyStrings.logoName2,
                          style: MyStyles.ts_FS35_FWbold_CMain_LS20_FFPoiretOne,
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
                      style: MyStyles.ts_FS18_FWbold_CText_LS1_FFPoiretOne,
                    ),
                  ],
                ),
              ),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
                  width: double.infinity,
                  height: 50.0,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(MyColors.secondaryColor),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ))),
                      onPressed: () {},
                      child: const Text(
                        MyStrings.nextText,
                        style: MyStyles.ts_FS22_FWbold_CWhite_LS1_FFPoiretOne,
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}
