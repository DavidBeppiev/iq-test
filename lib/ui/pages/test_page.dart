import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iq_tests/bloc/timer%20cubit/timer_cubit.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  void initState() {
    BlocProvider.of<TimerCubit>(context).startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        BlocProvider.of<TimerCubit>(context).resetTimer();
        return true;
      },
      child: SafeArea(
        child: Scaffold(
            body: BlocConsumer<TimerCubit, TimerState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            if (state is TimerInitial) {
              String strDigits(int n) => n.toString().padLeft(2, '0');
              final minutes = strDigits(state.duration!.inMinutes.remainder(60));
              final seconds = strDigits(state.duration!.inSeconds.remainder(60));
              return Row(
                children: [
                  const Text('time: '),
                  Text('$minutes:$seconds'),
                ],
              );
            }
            return const SizedBox();
          },
        )),
      ),
    );
  }
}
