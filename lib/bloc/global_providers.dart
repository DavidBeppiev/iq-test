import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iq_tests/bloc/timer%20cubit/timer_cubit.dart';

class BlocProviders{
  static final List<BlocProvider> providers = [
    BlocProvider<TimerCubit>(create: (_) => TimerCubit()),
  ];
}