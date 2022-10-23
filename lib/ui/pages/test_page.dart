import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iq_tests/bloc/tests%20cubit/test_cubit.dart';
import 'package:iq_tests/bloc/timer%20cubit/timer_cubit.dart';
import 'package:iq_tests/data/models/tests_model.dart';

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
    pageController.addListener(() {
      currentPage = pageController.page!;
    });
    super.initState();
  }

  PageController pageController = PageController();

  int currentPageIndex = 0;
  double currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        BlocProvider.of<TimerCubit>(context).resetTimer();
        return true;
      },
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
                  return Row(
                    children: [
                      const Text('time: '),
                      Text('$minutes:$seconds'),
                    ],
                  );
                }
                return const SizedBox();
              },
            ),
            BlocConsumer<TestCubit, TestState>(listener: (context, testsState) {
              // TODO: implement listener
            }, builder: (context, testsState) {
              if (testsState is TestLoaded) {
                List<Questions> questions = testsState.tests.data![0].questions!;
                return Expanded(
                  child: PageView.builder(
                      controller: pageController,
                      onPageChanged: (int i) {
                        setState(() {
                          currentPageIndex = i % (questions.length);
                        });
                      },
                      itemCount: questions.length,
                      itemBuilder: (context, i) {
                        return Center(child: Text(questions[i].question!));
                      }),
                );
              }
              return const CircularProgressIndicator();
            })
          ],
        )),
      ),
    );
  }
}
