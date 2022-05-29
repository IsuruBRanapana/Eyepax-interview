import 'package:dartz/dartz.dart';
import 'package:news_app_eyepax_practical/features/domain/entities/request/login_request_entity.dart';
import 'package:news_app_eyepax_practical/features/domain/entities/request/sign_up_request_entity.dart';
import 'package:news_app_eyepax_practical/features/domain/entities/response/news_response_entity.dart';
import 'package:news_app_eyepax_practical/features/domain/entities/response/sign_up_response_entity.dart';

import '../../../core/error/failures.dart';
import '../entities/response/login_response_entity.dart';

///Created By Isuru B. Ranapana
/// 2022-05-27 22:43

abstract class Repository {
  Future<Either<Failure, SignUpResponseEntity>> getSignUp(SignUpRequestEntity request);
  Future<Either<Failure, LoginResponseEntity>> getLogIn(LoginRequestEntity request);
  Future<Either<Failure, NewsResponse>> getAllNews();
}