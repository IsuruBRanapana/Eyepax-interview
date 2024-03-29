import 'package:connectivity_checker/connectivity_checker.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app_eyepax_practical/core/configurations/network/api_helper.dart';
import 'package:news_app_eyepax_practical/core/configurations/network/network_info.dart';
import 'package:news_app_eyepax_practical/features/data/datasources/local_data_source.dart';
import 'package:news_app_eyepax_practical/features/data/datasources/remote_data_source.dart';
import 'package:news_app_eyepax_practical/features/data/repositories/repository_impl.dart';
import 'package:news_app_eyepax_practical/features/domain/repository/repository.dart';
import 'package:news_app_eyepax_practical/features/domain/usecases/get_all_news_use_case.dart';
import 'package:news_app_eyepax_practical/features/domain/usecases/get_logged_out_use_case.dart';
import 'package:news_app_eyepax_practical/features/domain/usecases/get_logged_user_usecase.dart';
import 'package:news_app_eyepax_practical/features/domain/usecases/get_login_use_case.dart';
import 'package:news_app_eyepax_practical/features/domain/usecases/get_top_news_use_case.dart';
import 'package:news_app_eyepax_practical/features/presentation/bloc/auth/auth_bloc.dart';
import 'package:news_app_eyepax_practical/features/presentation/bloc/home/home_bloc.dart';

import '../../features/domain/usecases/get_search_news_use_case.dart';
import '../../features/domain/usecases/get_sign_up_use_case.dart';

///Created By Isuru B. Ranapana
/// 2022-05-27 22:50

final injection = GetIt.instance;

Future<void> setupLocator() async {
  injection.registerSingleton(Dio());
  injection.registerLazySingleton<ApiHelper>(() => ApiHelper());
  injection
      .registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(injection()));
  injection.registerLazySingleton(() => ConnectivityWrapper.instance);

  ///Repository
  injection.registerLazySingleton<Repository>(
    () => RepositoryImpl(
        remoteDataSource: injection(),
        localDataSource: injection(),
        networkInfo: injection()),
  );

  ///Use cases
  injection.registerLazySingleton(() => GetLoginUseCase(injection()));
  injection.registerLazySingleton(() => GetSignUpUseCase(injection()));
  injection.registerLazySingleton(() => GetAllNewsUsaCase(injection()));
  injection.registerLazySingleton(() => GetTopNewsUsaCase(injection()));
  injection.registerLazySingleton(() => GetSearchNewsUseCase(injection()));
  injection.registerLazySingleton(() => GetLoggedUserUseCase(injection()));
  injection.registerLazySingleton(() => GetLoggedOutUseCase(injection()));

  ///Data sources
  injection.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(apiHelper: injection()),
  );
  injection.registerLazySingleton<LocalDataSource>(
    () => LocalDataSourceImpl(),
  );
  injection.registerFactory(
    () => HomeBloc(
        getAllNewsUsaCase: injection(),
        getTopNewsUsaCase: injection(),
        getSearchNewsUsaCase: injection()),
  );
  injection.registerFactory(
    () => AuthBloc(
        getSignUpUseCase: injection(),
        getLoginUseCase: injection(),
        getLoggedUserUseCase: injection(),
        getLoggedOutUseCase: injection()),
  );
}
