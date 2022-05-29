import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app_eyepax_practical/features/domain/entities/request/sign_up_request_entity.dart';
import 'package:news_app_eyepax_practical/features/domain/entities/response/sign_up_response_entity.dart';
import 'package:news_app_eyepax_practical/features/domain/repository/repository.dart';

import '../../../core/error/failures.dart';
import '../../../core/usecase/usecase.dart';

///Created By Isuru B. Ranapana
/// 2022-05-29 02:22

class GetSignUpUseCase
    extends UseCase<SignUpResponseEntity, GetSignUpParameters> {
  final Repository repository;

  GetSignUpUseCase(this.repository);

  @override
  Future<Either<Failure, SignUpResponseEntity>> call(
      GetSignUpParameters params) async {
    return await repository.getSignUp(params.request);
  }
}

class GetSignUpParameters extends Equatable {
  final SignUpRequestEntity request;

  GetSignUpParameters({required this.request});

  @override
  List<Object> get props => [request];
}