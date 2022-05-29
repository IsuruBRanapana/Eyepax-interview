import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:news_app_eyepax_practical/core/configurations/network/network_info.dart';
import 'package:news_app_eyepax_practical/core/error/failures.dart';
import 'package:news_app_eyepax_practical/features/data/datasources/local_data_source.dart';
import 'package:news_app_eyepax_practical/features/data/datasources/remote_data_source.dart';
import 'package:news_app_eyepax_practical/features/data/models/common/common_error_response.dart';
import 'package:news_app_eyepax_practical/features/data/models/request/auth/login_request_model.dart';
import 'package:news_app_eyepax_practical/features/data/models/request/auth/sign_up_request_model.dart';
import 'package:news_app_eyepax_practical/features/data/models/response/login_response_model.dart';
import 'package:news_app_eyepax_practical/features/data/models/response/sign_up_response_model.dart';
import 'package:news_app_eyepax_practical/features/domain/entities/request/login_request_entity.dart';
import 'package:news_app_eyepax_practical/features/domain/entities/request/sign_up_request_entity.dart';
import 'package:news_app_eyepax_practical/features/domain/entities/response/login_response_entity.dart';
import 'package:news_app_eyepax_practical/features/domain/entities/response/news_response_entity.dart';
import 'package:news_app_eyepax_practical/features/domain/entities/response/sign_up_response_entity.dart';
import 'package:news_app_eyepax_practical/features/domain/repository/repository.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/error/messages.dart';

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

  @override
  Future<Either<Failure, LoginResponseModel>> getLogIn(LoginRequestModel request) async{
    if(await networkInfo.isConnected){
      try{
        final response = await localDataSource.getLogin(request);
        return Right(response);
      }on ServerException catch (ex) {
        return Left(ServerFailure(ex.errorResponseModel));
      } on UnAuthorizedException catch (ex) {
        return Left(AuthorizedFailure(ex.errorResponseModel));
      } on DioException catch (e) {
        return Left(ServerFailure(e.errorResponseModel));
      } on Exception {
        return Left(ServerFailure(ErrorResponseModel(
            responseError:
            ErrorMessages.SOMETHING_WRONG)));
      }
    }else{
      return Left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, SignUpResponseModel>> getSignUp(SignUpUserRequestModel request) async{
    if(await networkInfo.isConnected){
      try{
        final response = await localDataSource.getSignUp(request);
        return Right(response);
      }on ServerException catch (ex) {
        return Left(ServerFailure(ex.errorResponseModel));
      } on UnAuthorizedException catch (ex) {
        return Left(AuthorizedFailure(ex.errorResponseModel));
      } on DioException catch (e) {
        return Left(ServerFailure(e.errorResponseModel));
      } on Exception {
        return Left(ServerFailure(ErrorResponseModel(
            responseError:
            ErrorMessages.SOMETHING_WRONG)));
      }
    }else{
      return Left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, NewsResponse>> getAllNews() async{
    if(await networkInfo.isConnected){
      try{
        final response = await remoteDataSource.getAllNews();
        print(response.totalResults);
        return Right(response);
      }on ServerException catch (ex) {
        return Left(ServerFailure(ex.errorResponseModel));
      } on UnAuthorizedException catch (ex) {
        return Left(AuthorizedFailure(ex.errorResponseModel));
      } on DioException catch (e) {
        return Left(ServerFailure(e.errorResponseModel));
      } on Exception {
        return Left(ServerFailure(ErrorResponseModel(
            responseError:
            ErrorMessages.SOMETHING_WRONG)));
      }
    }else{
      return Left(ConnectionFailure());
    }
  }

}