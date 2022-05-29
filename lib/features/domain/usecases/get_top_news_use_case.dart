import 'package:dartz/dartz.dart';
import 'package:news_app_eyepax_practical/core/error/failures.dart';
import 'package:news_app_eyepax_practical/core/usecase/usecase.dart';
import 'package:news_app_eyepax_practical/features/domain/entities/response/news_response_entity.dart';
import 'package:news_app_eyepax_practical/features/domain/repository/repository.dart';

///Created By Isuru B. Ranapana
/// 2022-05-29 12:13

class GetTopNewsUsaCase extends UseCase<NewsResponse, NoParams> {
  final Repository repository;

  GetTopNewsUsaCase(this.repository);

  @override
  Future<Either<Failure, NewsResponse>> call(NoParams params) async {
    return await repository.getTopNews();
  }
}