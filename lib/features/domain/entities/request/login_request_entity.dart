import 'package:news_app_eyepax_practical/features/data/models/request/auth/login_request_model.dart';

///Created By Isuru B. Ranapana
/// 2022-05-29 01:55

class LoginRequestEntity extends LoginRequestModel {
  final String email;
  final String password;



  LoginRequestEntity({
    required this.email,
    required this.password,
  }) : super(
    email: email,
    password: password,
  );
}