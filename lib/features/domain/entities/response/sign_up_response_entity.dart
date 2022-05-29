import 'package:equatable/equatable.dart';

///Created By Isuru B. Ranapana
/// 2022-05-29 02:04

class SignUpResponseEntity extends Equatable {
  final String success;

  SignUpResponseEntity({required this.success});

  @override
  List<Object> get props => [success];
}
