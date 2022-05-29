import 'package:equatable/equatable.dart';

///Created By Isuru B. Ranapana
/// 2022-05-29 01:58

class LoginResponseEntity extends Equatable {
  final String success;
  final String? firstName;
  final String? lastName;
  final String? email;

  LoginResponseEntity({
    required this.success,
    this.firstName,
    this.lastName,
    this.email,
  });

  @override
  List<Object> get props => [success, firstName!, lastName!, email!];
}
