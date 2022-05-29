import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/response/sign_up_response_entity.dart';

///Created By Isuru B. Ranapana
/// 2022-05-29 02:04
part 'sign_up_response_model.g.dart';

@JsonSerializable()
class SignUpResponseModel extends SignUpResponseEntity {
  @JsonKey(name: "success")
  final String success;

  SignUpResponseModel({required this.success}) : super(success: success);

  factory SignUpResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpResponseModelToJson(this);
}
