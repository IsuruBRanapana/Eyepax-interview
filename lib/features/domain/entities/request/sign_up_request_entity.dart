import 'package:news_app_eyepax_practical/features/data/models/request/auth/sign_up_request_model.dart';

///Created By Isuru B. Ranapana
/// 2022-05-29 01:54

class SignUpRequestEntity extends SignUpUserRequestModel {
  final String email;
  final String password;
  final String firstName;
  final String lastName;

  SignUpRequestEntity({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
  }) : super(
          email: email,
          password: password,
          firstName: firstName,
          lastName: lastName,
        );
}
