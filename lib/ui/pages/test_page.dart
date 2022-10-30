import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iq_tests/bloc/tests%20cubit/test_cubit.dart';
import 'package:iq_tests/bloc/timer%20cubit/timer_cubit.dart';
import 'package:iq_tests/data/constants/colors.dart';
import 'package:iq_tests/data/constants/strings.dart';
import 'package:iq_tests/data/constants/styles.dart';
import 'package:iq_tests/data/models/tests_model.dart';
import 'package:iq_tests/ui/pages/test_result_page.dart';
import 'package:iq_tests/ui/views/test_view.dart';
import 'package:iq_tests/ui/widgets/alerts/abort_test_alert.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  void initState() {
    BlocProvider.of<TestCubit>(context).loadTests();
    BlocProvider.of<TimerCubit>(context).startTimer();
    super.initState();
  }

  TextEditingController _answerController = TextEditingController();

  final OutlineInputBorder _outLineBorder = const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(15.0)),
    borderSide: BorderSide(color: MyColors.davysGreyColor),
  );

  final Cubic _curves = Curves.easeInSine;
  final Duration transitionBetweenTests = const Duration(milliseconds: 250);

  List<Questions> questions = [];

  PageController pageController = PageController();

  int _currentQuestion = 1;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _previousPage(),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: Scaffold(
              body: Column(
            children: [
              BlocConsumer<TimerCubit, TimerState>(
                listener: (context, timeState) {
                  // TODO: implement listener
                },
                builder: (context, timeState) {
                  if (timeState is TimerInitial) {
                    String strDigits(int n) => n.toString().padLeft(2, '0');
                    final minutes = strDigits(timeState.duration!.inMinutes.remainder(60));
                    final seconds = strDigits(timeState.duration!.inSeconds.remainder(60));
                    return Padding(
                      padding: const EdgeInsets.only(top: 14.0, right: 20.0, left: 14.0),
                      child: Stack(
                        children: [
                          Positioned(
                            right: 0.0,
                            top: 4.5,
                            child: Text(
                              '$_currentQuestion/${questions.length}',
                              style: MyStyles.ts_FS25_CDavyc_Grey_lS17_FFNumbers,
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              '$minutes:$seconds',
                              style: MyStyles.ts_FS32_CDavyc_Grey_lS17_FFNumbers,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Positioned(
                            bottom: 0.0,
                            left: 0.0,
                            child: IconButton(
                                splashRadius: 19.0,
                                onPressed: _previousPage,
                                icon: const Icon(Icons.arrow_back_ios_new)),
                          )
                        ],
                      ),
                    );
                  }
                  return const SizedBox();
                },
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Divider(
                  thickness: 1.8,
                ),
              ),
              BlocConsumer<TestCubit, TestState>(listener: (context, testsState) {
                if (testsState is TestsResult) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TestsResultPage(
                              countRight: testsState.countRight, countWrong: testsState.countWrong)));
                }
              }, builder: (context, testsState) {
                if (testsState is TestsLoaded) {
                  questions = testsState.tests.data![0].questions!;
                  return Expanded(
                    child: PageView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: pageController,
                        itemCount: questions.length,
                        onPageChanged: (int index) {
                          setState(() => _currentQuestion = index + 1);
                        },
                        itemBuilder: (context, i) {
                          return TestView(questions[i]);
                        }),
                  );
                }
                return const SizedBox();
              }),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, right: 20.0, bottom: 10.0, left: 20.0),
                child: Row(
                  children: [
                    Expanded(
                        child: TextFormField(
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 10.0),
                          hintText: MyStrings.answerText,
                          enabledBorder: _outLineBorder,
                          focusedBorder: _outLineBorder),
                      cursorColor: MyColors.textColor,
                      controller: _answerController,
                      style: MyStyles.ts_FS25_FWbold_CText_LS1_FFPoiretOne,
                    )),
                    IconButton(
                        onPressed: () => _nextPage(_answerController.text),
                        splashRadius: 25.0,
                        icon: const Icon(
                          Icons.arrow_forward_ios,
                          color: MyColors.davysGreyColor,
                        ))
                  ],
                ),
              )
            ],
          )),
        ),
      ),
    );
  }

  void _nextPage(String _answer) {
    if (pageController.page! + 1 != questions.length) {
      _answer = _answer.toLowerCase().replaceAll(' ', '');
      BlocProvider.of<TestCubit>(context).userAnswer(_answer, pageController.page!.toInt());
      _answerController.clear();
      pageController.nextPage(duration: transitionBetweenTests, curve: _curves);
    } else {
      BlocProvider.of<TestCubit>(context).calculateResult();
    }
  }

  Future<bool> _previousPage() async {
    if (pageController.page != 0) {
      pageController.previousPage(duration: transitionBetweenTests, curve: _curves);
      return false;
    } else {
      abortTestAlert(context);
      return true;
    }
  }
}
