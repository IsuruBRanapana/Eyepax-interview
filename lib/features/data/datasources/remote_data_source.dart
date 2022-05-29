import 'package:news_app_eyepax_practical/core/configurations/network/api_helper.dart';
import 'package:news_app_eyepax_practical/features/data/models/response/news_response_model.dart';

import '../../../core/configurations/network/network_config.dart';

///Created By Isuru B. Ranapana
/// 2022-05-27 22:43

abstract class RemoteDataSource {
  Future<NewsResponseModel> getAllNews();
  Future<NewsResponseModel> getTopNews();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final ApiHelper apiHelper;

  RemoteDataSourceImpl({required this.apiHelper});

  @override
  Future<NewsResponseModel> getAllNews() async {
    try {
      final response = await apiHelper.getWithQParam('everything', {
        "q": "tesla",
        "from": "2022-04-29",
        "sortBy": "publishedAt",
        "apiKey": NetworkConfig.APIKey
      });
      return NewsResponseModel.fromJson(response.data);
    } on Exception {
      rethrow;
    }
  }
  @override
  Future<NewsResponseModel> getTopNews() async {
    try {
      final response = await apiHelper.getWithQParam('top-headlines', {
        //todo: change country according to location
        "country": "us",
        "apiKey": NetworkConfig.APIKey
      });
      return NewsResponseModel.fromJson(response.data);
    } on Exception {
      rethrow;
    }
  }
}
