import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iq_tests/bloc/timer%20cubit/timer_cubit.dart';
import 'package:iq_tests/data/constants/strings.dart';
import 'package:iq_tests/data/constants/styles.dart';
import 'package:iq_tests/ui/pages/home_page.dart';
import 'package:iq_tests/ui/pages/tests_description_page.dart';
import 'package:iq_tests/ui/widgets/custom_button.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';


void abortTestAlert (BuildContext context) {
  Dialogs.materialDialog(
    titleStyle: MyStyles.ts_FS18_FWbold_CDavys_Grey_LS1_FFPoiretOne,
    color: Colors.white,
    titleAlign: TextAlign.center,
    title: MyStrings.warningAlertText,
    lottieBuilder: Lottie.asset(
      'assets/animations/astonished-emoji-oh-oh-animation.json',
      fit: BoxFit.contain,
    ),
    context: context,
    actions: [
      customButton(
        double.infinity,
          null,
          MyStrings.backToDescriptionText, () {
        BlocProvider.of<TimerCubit>(context).resetTimer();
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
            const HomePage()), (Route<dynamic> route) => false);
      })
    ],
  );
}