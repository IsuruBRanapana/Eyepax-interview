import 'package:news_app_eyepax_practical/features/domain/entities/response/login_response_entity.dart';
import 'package:news_app_eyepax_practical/features/presentation/bloc/base_state.dart';

import '../../../domain/entities/response/sign_up_response_entity.dart';

abstract class AuthState extends BaseState<AuthState> {}

class AuthInitial extends AuthState {}

class LoginSuccessState extends AuthState{
  final LoginResponseEntity responseEntity;

  LoginSuccessState(this.responseEntity);
}

class SignUpSuccessState extends AuthState{
  final SignUpResponseEntity responseEntity;

  SignUpSuccessState(this.responseEntity);
}
class GetLoggedUserSuccessState extends AuthState{
  final LoginResponseEntity responseEntity;

  GetLoggedUserSuccessState(this.responseEntity);
}
class GetLoggedOutSuccessState extends AuthState{
  final SignUpResponseEntity responseEntity;

  GetLoggedOutSuccessState(this.responseEntity);
}