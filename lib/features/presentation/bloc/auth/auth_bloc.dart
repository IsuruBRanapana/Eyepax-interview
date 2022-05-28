import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:news_app_eyepax_practical/features/presentation/bloc/auth/auth_event.dart';
import 'package:news_app_eyepax_practical/features/presentation/bloc/auth/auth_state.dart';
import 'package:news_app_eyepax_practical/features/presentation/bloc/base_bloc.dart';
import 'package:news_app_eyepax_practical/features/presentation/bloc/base_state.dart';

class AuthBloc extends Base<AuthEvent, BaseState<AuthState>> {
  AuthBloc() : super(AuthInitial());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
