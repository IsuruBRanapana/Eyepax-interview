import 'package:json_annotation/json_annotation.dart';
import 'package:news_app_eyepax_practical/features/domain/entities/response/login_response_entity.dart';

///Created By Isuru B. Ranapana
/// 2022-05-29 02:01
part 'login_response_model.g.dart';

@JsonSerializable()
class LoginResponseModel extends LoginResponseEntity {
  @JsonKey(name: "success")
  final String success;
  @JsonKey(name: "firstname")
  final String? firstName;
  @JsonKey(name: "lastname")
  final String? lastName;
  @JsonKey(name: "email")
  final String? email;

  LoginResponseModel({
    required this.success,
    this.firstName,
    this.lastName,
    this.email,
  }) : super(
            success: success,
            firstName: firstName,
            lastName: lastName,
            email: email);

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseModelToJson(this);
}
