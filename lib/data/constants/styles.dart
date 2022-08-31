import 'package:flutter/material.dart';
import 'package:iq_tests/data/constants/colors.dart';

class MyStyles extends TextStyle{
  static const ts_FS50_FWbold_CMain_LS7_FFPoiretOne = TextStyle(
    fontSize: 35.0,
      letterSpacing: 7.3,
    fontWeight: FontWeight.bold,
    color: MyColors.textColor,
    fontFamily: 'PoiretOne'
  );

  static const ts_FS35_FWbold_CMain_LS20_FFPoiretOne = TextStyle(
    fontSize: 35.0,
    fontWeight: FontWeight.bold,
    color: MyColors.textColor,
    letterSpacing: 20.0,
    fontFamily: 'PoiretOne'
  );

  static const ts_FS18_FWbold_CText_LS1_FFPoiretOne = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    color: MyColors.textColor,
    letterSpacing: 1.4,
    fontFamily: 'PoiretOne'
  );

  static const ts_FS22_FWbold_CWhite_LS1_FFPoiretOne = TextStyle(
    fontSize: 22.0,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    letterSpacing: 1.6,
    fontFamily: 'PoiretOne'
  );

}