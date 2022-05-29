
import '../base_event.dart';

abstract class HomeEvent extends BaseEvent{}

class GetAllNewsEvent extends HomeEvent{}

class GetTopNewsEvent extends HomeEvent{}