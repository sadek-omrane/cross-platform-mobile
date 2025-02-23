import 'package:json_annotation/json_annotation.dart';

part 'api_reponse.g.dart';

@JsonSerializable()
class ApiResponse {
  final dynamic data;
  final bool? success;
  final String message;
  final dynamic? attributes;

  ApiResponse({
    this.data,
    required this.success,
    required this.message,
    this.attributes,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ApiResponseToJson(this);
}
