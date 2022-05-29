import 'package:news_app_eyepax_practical/features/domain/entities/request/login_request_entity.dart';
import 'package:news_app_eyepax_practical/features/domain/entities/request/sign_up_request_entity.dart';

import '../base_event.dart';

abstract class AuthEvent extends BaseEvent{}

class SignUpEvent extends AuthEvent{
  final SignUpRequestEntity request;

  SignUpEvent({required this.request});
}
class LoginEvent extends AuthEvent{
  final LoginRequestEntity request;

  LoginEvent({required this.request});
}
class GetLoggedUserEvent extends AuthEvent{}