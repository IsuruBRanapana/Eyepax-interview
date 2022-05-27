import 'package:news_app_eyepax_practical/core/configurations/network/network_info.dart';
import 'package:news_app_eyepax_practical/features/data/datasources/local_data_source.dart';
import 'package:news_app_eyepax_practical/features/data/datasources/remote_data_source.dart';
import 'package:news_app_eyepax_practical/features/domain/repository/repository.dart';

///Created By Isuru B. Ranapana
/// 2022-05-27 22:43

class RepositoryImpl implements Repository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  RepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

}