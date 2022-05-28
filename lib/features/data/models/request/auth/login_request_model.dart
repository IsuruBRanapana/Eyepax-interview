import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

///Created By Isuru B. Ranapana
/// 2022-05-29 01:51
part 'login_request_model.g.dart';
@JsonSerializable()
class LoginRequestModel extends Equatable{
  @JsonKey(name:"email")
  final String email;
  @JsonKey(name:"password")
  final String password;

  LoginRequestModel({required this.email, required this.password});

  @override
  List<Object> get props =>
      [email, password];

  factory LoginRequestModel.fromJson(Map<String,dynamic> json)=>_$LoginRequestModelFromJson(json);
  Map <String,dynamic> toJson()=>_$LoginRequestModelToJson(this);
}