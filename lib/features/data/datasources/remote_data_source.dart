import 'package:news_app_eyepax_practical/core/configurations/network/api_helper.dart';

///Created By Isuru B. Ranapana
/// 2022-05-27 22:43

abstract class RemoteDataSource {

}

class RemoteDataSourceImpl implements RemoteDataSource {
  final ApiHelper apiHelper;

  RemoteDataSourceImpl({required this.apiHelper});
}