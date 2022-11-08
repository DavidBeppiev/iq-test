import 'package:flutter/material.dart';
import 'package:iq_tests/data/constants/colors.dart';
import 'package:iq_tests/data/constants/strings.dart';
import 'package:iq_tests/data/constants/styles.dart';

Widget myLogoWidget () {
  return  Column(
    children: [
      Image.asset(
        'assets/images/pi_logo.png',
        width: 70.0,
        color: MyColors.textColor,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            MyStrings.logoName1.toUpperCase(),
            style: MyStyles.ts_FS30_FWbold_CText_LS7_FFPoiretOne,
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
  );
}