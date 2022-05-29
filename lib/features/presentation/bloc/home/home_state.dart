import 'package:news_app_eyepax_practical/features/domain/entities/response/news_response_entity.dart';

import '../base_state.dart';

abstract class HomeState extends BaseState<HomeState> {}

class InitialHomeState extends HomeState {}

class GetAllNewsSuccessState extends HomeState{
  final NewsResponse responseEntity;

  GetAllNewsSuccessState(this.responseEntity);
}
class GetTopNewsSuccessState extends HomeState{
  final NewsResponse responseEntity;

  GetTopNewsSuccessState(this.responseEntity);
}