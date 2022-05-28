import 'package:news_app_eyepax_practical/features/data/models/response/login_response_model.dart';

import '../models/request/auth/login_request_model.dart';

///Created By Isuru B. Ranapana
/// 2022-05-27 22:42

abstract class LocalDataSource {
  Future<LoginResponseModel> getLogin(LoginRequestModel request);

}

class LocalDataSourceImpl implements LocalDataSource {
  @override
  Future<LoginResponseModel> getLogin(LoginRequestModel request) {
    // TODO: implement getLogin
    throw UnimplementedError();
  }

}