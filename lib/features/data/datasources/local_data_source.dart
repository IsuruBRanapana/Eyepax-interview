import 'package:hive_flutter/hive_flutter.dart';
import 'package:news_app_eyepax_practical/features/data/models/request/auth/sign_up_request_model.dart';
import 'package:news_app_eyepax_practical/features/data/models/response/login_response_model.dart';
import 'package:news_app_eyepax_practical/features/data/models/response/sign_up_response_model.dart';
import 'package:path_provider/path_provider.dart';

import '../models/request/auth/login_request_model.dart';

///Created By Isuru B. Ranapana
/// 2022-05-27 22:42
var favoritesBox = Hive.box('authBox1');
List<String> books = [];
// var authBox = ;

abstract class LocalDataSource {
  Future<LoginResponseModel> getLogin(LoginRequestModel request);

  Future<SignUpResponseModel> getSignUp(SignUpUserRequestModel request);

}

class LocalDataSourceImpl implements LocalDataSource {

  @override
  Future<LoginResponseModel> getLogin(LoginRequestModel request) async {
    var box = await Hive.openBox('authBox');
    try{
      final user = box.get(request.email);
      if(user!=null){
        if(user['email']==request.email&&user['password']==request.password){
          return LoginResponseModel(success: "success");
        }else{
          return LoginResponseModel(success: "failed");
        }
      }else{
        return LoginResponseModel(success: "failed");
      }
    }on Exception{
      rethrow;
    }

  }

  @override
  Future<SignUpResponseModel> getSignUp(SignUpUserRequestModel request) async {
    var box = await Hive.openBox('authBox');
    try{
      await box.put(request.email, {
        'email': request.email,
        'password': request.password,
        'firstname': request.firstName,
        'lastname': request.lastName
      });
      return SignUpResponseModel(success: "success");
    }on Exception{
      rethrow;
    }

  }

}