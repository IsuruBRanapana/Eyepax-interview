
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app_eyepax_practical/features/domain/entities/request/search_request.dart';
import 'package:news_app_eyepax_practical/features/domain/entities/response/news_response_entity.dart';

import '../../../core/error/failures.dart';
import '../../../core/usecase/usecase.dart';
import '../repository/repository.dart';

///Created By Isuru B. Ranapana
/// 2022-05-29 14:19

class GetSearchNewsUseCase
    extends UseCase<NewsResponse, GetSearchNewsParameters> {
  final Repository repository;

  GetSearchNewsUseCase(this.repository);

  @override
  Future<Either<Failure, NewsResponse>> call(
      GetSearchNewsParameters params) async {
    return await repository.getSearchNews(params.request);
  }
}

class GetSearchNewsParameters extends Equatable {
  final SearchRequest request;

  GetSearchNewsParameters({required this.request});

  @override
  List<Object> get props => [request];
}