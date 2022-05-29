import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app_eyepax_practical/features/domain/entities/request/login_request_entity.dart';
import 'package:news_app_eyepax_practical/features/domain/entities/response/login_response_entity.dart';
import 'package:news_app_eyepax_practical/features/domain/repository/repository.dart';

import '../../../core/error/failures.dart';
import '../../../core/usecase/usecase.dart';

///Created By Isuru B. Ranapana
/// 2022-05-29 02:19

class GetLoginUseCase extends UseCase<LoginResponseEntity, GetLoginParameters> {
  final Repository repository;

  GetLoginUseCase(this.repository);

  @override
  Future<Either<Failure, LoginResponseEntity>> call(
      GetLoginParameters params) async {
    return await repository.getLogIn(params.request);
  }
}

class GetLoginParameters extends Equatable {
  final LoginRequestEntity request;

  GetLoginParameters({required this.request});

  @override
  List<Object> get props => [request];
}