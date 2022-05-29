
import 'package:news_app_eyepax_practical/features/domain/entities/request/search_request.dart';

import '../base_event.dart';

abstract class HomeEvent extends BaseEvent{}

class GetAllNewsEvent extends HomeEvent{}

class GetTopNewsEvent extends HomeEvent{}

class GetSearchNewsEvent extends HomeEvent{
  final SearchRequest request;

  GetSearchNewsEvent({required this.request});
}