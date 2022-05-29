import 'package:dartz/dartz.dart';
import 'package:news_app_eyepax_practical/core/error/failures.dart';
import 'package:news_app_eyepax_practical/features/domain/entities/response/sign_up_response_entity.dart';
import 'package:news_app_eyepax_practical/features/domain/repository/repository.dart';

import '../../../core/usecase/usecase.dart';

///Created By Isuru B. Ranapana
/// 2022-05-29 16:03

class GetLoggedOutUseCase extends UseCase<SignUpResponseEntity, NoParams> {
  final Repository repository;

  GetLoggedOutUseCase(this.repository);

  @override
  Future<Either<Failure, SignUpResponseEntity>> call(NoParams params) async {
    return await repository.getLoggedOut();
  }
}
