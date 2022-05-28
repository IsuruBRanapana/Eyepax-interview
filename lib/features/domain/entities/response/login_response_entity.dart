import 'package:equatable/equatable.dart';

///Created By Isuru B. Ranapana
/// 2022-05-29 01:58

class LoginResponseEntity extends Equatable {
  final String success;

  LoginResponseEntity({required this.success});

  @override
  List<Object> get props => [success];
}
