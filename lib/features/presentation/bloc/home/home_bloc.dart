import 'dart:async';

import 'package:news_app_eyepax_practical/features/presentation/bloc/base_bloc.dart';
import 'package:news_app_eyepax_practical/features/presentation/bloc/base_state.dart';
import 'package:news_app_eyepax_practical/features/presentation/bloc/home/home_event.dart';
import 'package:news_app_eyepax_practical/features/presentation/bloc/home/home_state.dart';

class HomeBloc extends Base<HomeEvent, BaseState<HomeState>> {
  HomeBloc() : super(InitialHomeState());

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
