import 'package:news_app_eyepax_practical/core/error/failures.dart';

///Created By Isuru B. Ranapana
/// 2022-05-27 21:25

class ErrorMessages {
  static const String SOMETHING_WRONG = 'Something went wrong';
  static const String CONNECTION_ERROR = 'Connection Error';
  static const String UNAUTHORIZE = 'Authorization Error';
  static const String UNEXPECTED = 'Unexpected Error';
  static const String ERROR = 'Error';

  String mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ConnectionFailure:
        return CONNECTION_ERROR;
      case ServerFailure:
        return (failure as ServerFailure).errorResponse.responseError!;
      case AuthorizedFailure:
        return UNAUTHORIZE;
      default:
        return UNEXPECTED;
    }
  }
}
