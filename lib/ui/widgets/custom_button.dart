import 'package:flutter/material.dart';
import 'package:iq_tests/data/constants/colors.dart';
import 'package:iq_tests/data/constants/styles.dart';

Widget CustomButton(String text, Function() fun) {
   return Container(
     margin: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
     width: double.infinity,
     height: 59.0,
     child: ElevatedButton(
         style: ButtonStyle(
             backgroundColor: MaterialStateProperty.all(MyColors.secondaryColor),
             shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                 RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(25.0),
                 ))),
         onPressed: fun,
         child: Text(
           text,
           style: MyStyles.ts_FS22_FWbold_CWhite_LS1_FFPoiretOne,
           textAlign: TextAlign.center,
         )),
   );
}