import 'package:equatable/equatable.dart';
import 'package:news_app_eyepax_practical/features/data/models/common/common_error_response.dart';

///Created By Isuru B. Ranapana
/// 2022-05-27 21:07

abstract class Failure extends Equatable {
  Failure([List properties = const <dynamic>[]]);

  @override
  List<Object> get props => props;
}

// General failures
class ServerFailure extends Failure {
  final ErrorResponseModel errorResponse;

  ServerFailure(this.errorResponse);
}

class CacheFailure extends Failure {}

class ConnectionFailure extends Failure {}

class AuthorizedFailure extends Failure {
  final ErrorResponseModel errorResponse;

  AuthorizedFailure(this.errorResponse);
}
