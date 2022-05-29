import 'package:equatable/equatable.dart';

///Created By Isuru B. Ranapana
/// 2022-05-27 20:58

class ErrorResponse extends Equatable {
  const ErrorResponse({
    this.responseCode,
    this.responseError,
  });

  final String? responseCode;
  final String? responseError;

  @override
  List<Object> get props => [responseError!, responseCode!];
}
