import 'package:dartz/dartz.dart';
import 'package:news_app_eyepax_practical/core/usecase/usecase.dart';
import 'package:news_app_eyepax_practical/features/domain/repository/repository.dart';

import '../../../core/error/failures.dart';
import '../entities/response/login_response_entity.dart';

///Created By Isuru B. Ranapana
/// 2022-05-29 15:39

class GetLoggedUserUseCase extends UseCase<LoginResponseEntity, NoParams> {
  final Repository repository;

  GetLoggedUserUseCase(this.repository);

  @override
  Future<Either<Failure, LoginResponseEntity>> call(NoParams params) async {
    return await repository.getLoggedUser();
  }
}
