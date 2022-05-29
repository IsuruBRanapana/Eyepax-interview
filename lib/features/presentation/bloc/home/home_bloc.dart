import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:news_app_eyepax_practical/core/usecase/usecase.dart';
import 'package:news_app_eyepax_practical/features/domain/entities/common/error_response.dart';
import 'package:news_app_eyepax_practical/features/domain/entities/response/news_response_entity.dart';
import 'package:news_app_eyepax_practical/features/presentation/bloc/base_bloc.dart';
import 'package:news_app_eyepax_practical/features/presentation/bloc/base_state.dart';
import 'package:news_app_eyepax_practical/features/presentation/bloc/home/home_event.dart';
import 'package:news_app_eyepax_practical/features/presentation/bloc/home/home_state.dart';

import '../../../../core/error/failures.dart';
import '../../../domain/usecases/get_all_news_use_case.dart';
import '../../../domain/usecases/get_top_news_use_case.dart';

class HomeBloc extends Base<HomeEvent, BaseState<HomeState>> {
  HomeBloc({required this.getAllNewsUsaCase,required this.getTopNewsUsaCase, }) : super(InitialHomeState());
  final GetAllNewsUsaCase getAllNewsUsaCase;
  final GetTopNewsUsaCase getTopNewsUsaCase;

  @override
  Stream<BaseState<HomeState>> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is GetAllNewsEvent) {
      yield APILoadingState();
      final failureOrSuccess =
      await getAllNewsUsaCase(NoParams());
      yield* _eitherFailureOrSuccessGetAllEvent(failureOrSuccess);
    }else if(event is GetTopNewsEvent) {
      yield APILoadingState();
      final failureOrSuccess =
      await getAllNewsUsaCase(NoParams());
      yield* _eitherFailureOrSuccessGetTopEvent(failureOrSuccess);
    }
  }
  Stream<BaseState<HomeState>> _eitherFailureOrSuccessGetAllEvent(
      Either<Failure, NewsResponse> failureOrSuccess) async* {
    yield failureOrSuccess.fold(
            (failure) => APIFailureState(
            errorResponseModel: ErrorResponse(
                responseCode: "Failed", responseError: "ApI Failed")),
            (success) => GetAllNewsSuccessState(success));
  }
  Stream<BaseState<HomeState>> _eitherFailureOrSuccessGetTopEvent(
      Either<Failure, NewsResponse> failureOrSuccess) async* {
    yield failureOrSuccess.fold(
            (failure) => APIFailureState(
            errorResponseModel: ErrorResponse(
                responseCode: "Failed", responseError: "ApI Failed")),
            (success) => GetTopNewsSuccessState(success));
  }
}
