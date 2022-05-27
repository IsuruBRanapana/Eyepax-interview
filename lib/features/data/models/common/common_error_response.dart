import 'package:json_annotation/json_annotation.dart';
import 'package:news_app_eyepax_practical/features/domain/entities/common/error_response.dart';

///Created By Isuru B. Ranapana
/// 2022-05-27 20:57
part 'common_error_response.g.dart';

@JsonSerializable()
class ErrorResponseModel extends ErrorResponse {
  ErrorResponseModel({
    this.responseCode,
    this.responseError,
  }) : super(responseCode: responseCode, responseError: responseError);

  @JsonKey(name: 'response_code')
  final String? responseCode;
  @JsonKey(name: 'response_error')
  final String? responseError;

  factory ErrorResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ErrorResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorResponseModelToJson(this);
}
