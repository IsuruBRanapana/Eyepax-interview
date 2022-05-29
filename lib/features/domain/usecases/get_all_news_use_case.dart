import 'package:dartz/dartz.dart';
import 'package:news_app_eyepax_practical/features/domain/entities/response/news_response_entity.dart';
import 'package:news_app_eyepax_practical/features/domain/repository/repository.dart';

import '../../../core/error/failures.dart';
import '../../../core/usecase/usecase.dart';

///Created By Isuru B. Ranapana
/// 2022-05-29 11:13

class GetAllNewsUsaCase extends UseCase<NewsResponse, NoParams> {
  final Repository repository;

  GetAllNewsUsaCase(this.repository);

  @override
  Future<Either<Failure, NewsResponse>> call(NoParams params) async {
    return await repository.getAllNews();
  }
}