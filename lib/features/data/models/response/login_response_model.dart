import 'package:json_annotation/json_annotation.dart';
import 'package:news_app_eyepax_practical/features/domain/entities/response/login_response_entity.dart';

///Created By Isuru B. Ranapana
/// 2022-05-29 02:01
part 'login_response_model.g.dart';
@JsonSerializable()
class LoginResponseModel extends LoginResponseEntity {
  @JsonKey(name: "success")
  final String success;

  LoginResponseModel({required this.success}) : super(success: success);

  factory LoginResponseModel.fromJson(Map<String,dynamic> json)=>_$LoginResponseModelFromJson(json);
  Map <String,dynamic> toJson()=>_$LoginResponseModelToJson(this);
}
