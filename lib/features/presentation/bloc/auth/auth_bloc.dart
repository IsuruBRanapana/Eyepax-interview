import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:news_app_eyepax_practical/core/usecase/usecase.dart';
import 'package:news_app_eyepax_practical/features/domain/entities/response/login_response_entity.dart';
import 'package:news_app_eyepax_practical/features/domain/entities/response/sign_up_response_entity.dart';
import 'package:news_app_eyepax_practical/features/domain/usecases/get_logged_user_usecase.dart';
import 'package:news_app_eyepax_practical/features/domain/usecases/get_login_use_case.dart';
import 'package:news_app_eyepax_practical/features/domain/usecases/get_sign_up_use_case.dart';
import 'package:news_app_eyepax_practical/features/presentation/bloc/auth/auth_event.dart';
import 'package:news_app_eyepax_practical/features/presentation/bloc/auth/auth_state.dart';
import 'package:news_app_eyepax_practical/features/presentation/bloc/base_bloc.dart';
import 'package:news_app_eyepax_practical/features/presentation/bloc/base_state.dart';

import '../../../../core/error/failures.dart';
import '../../../domain/entities/common/error_response.dart';
import '../../../domain/usecases/get_logged_out_use_case.dart';

class AuthBloc extends Base<AuthEvent, BaseState<AuthState>> {
  final GetLoginUseCase getLoginUseCase;
  final GetSignUpUseCase getSignUpUseCase;
  final GetLoggedUserUseCase getLoggedUserUseCase;
  final GetLoggedOutUseCase getLoggedOutUseCase;

  AuthBloc({
    required this.getLoginUseCase,
    required this.getSignUpUseCase,
    required this.getLoggedUserUseCase,
    required this.getLoggedOutUseCase,
  }) : super(AuthInitial());

  @override
  Stream<BaseState<AuthState>> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is SignUpEvent) {
      yield APILoadingState();
      final failureOrSuccess =
          await getSignUpUseCase(GetSignUpParameters(request: event.request));
      yield* _eitherFailureOrSuccessSignUp(failureOrSuccess);
    } else if (event is LoginEvent) {
      yield APILoadingState();
      final failureOrSuccess =
          await getLoginUseCase(GetLoginParameters(request: event.request));
      yield* _eitherFailureOrSuccessLogin(failureOrSuccess);
    } else if (event is GetLoggedUserEvent) {
      yield APILoadingState();
      final failureOrSuccess = await getLoggedUserUseCase(NoParams());
      yield* _eitherFailureOrSuccessLoggedUser(failureOrSuccess);
    } else if (event is GetLoggedOutEvent) {
      yield APILoadingState();
      final failureOrSuccess = await getLoggedOutUseCase(NoParams());
      yield* _eitherFailureOrSuccessLoggedOut(failureOrSuccess);
    }
  }

  Stream<BaseState<AuthState>> _eitherFailureOrSuccessSignUp(
      Either<Failure, SignUpResponseEntity> failureOrSuccess) async* {
    yield failureOrSuccess.fold(
        (failure) => APIFailureState(
            errorResponseModel: ErrorResponse(
                responseCode: "Failed", responseError: "ApI Failed")),
        (success) => SignUpSuccessState(success));
  }

  Stream<BaseState<AuthState>> _eitherFailureOrSuccessLogin(
      Either<Failure, LoginResponseEntity> failureOrSuccess) async* {
    yield failureOrSuccess.fold(
        (failure) => APIFailureState(
            errorResponseModel: ErrorResponse(
                responseCode: "Failed", responseError: "ApI Failed")),
        (success) => LoginSuccessState(success));
  }

  Stream<BaseState<AuthState>> _eitherFailureOrSuccessLoggedUser(
      Either<Failure, LoginResponseEntity> failureOrSuccess) async* {
    yield failureOrSuccess.fold(
        (failure) => APIFailureState(
            errorResponseModel: ErrorResponse(
                responseCode: "Failed", responseError: "ApI Failed")),
        (success) => GetLoggedUserSuccessState(success));
  }

  Stream<BaseState<AuthState>> _eitherFailureOrSuccessLoggedOut(
      Either<Failure, SignUpResponseEntity> failureOrSuccess) async* {
    yield failureOrSuccess.fold(
        (failure) => APIFailureState(
            errorResponseModel: ErrorResponse(
                responseCode: "Failed", responseError: "ApI Failed")),
        (success) => GetLoggedOutSuccessState(success));
  }
}
