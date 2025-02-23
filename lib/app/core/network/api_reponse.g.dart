// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_reponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponse _$ApiResponseFromJson(Map<String, dynamic> json) => ApiResponse(
      data: json['data'],
      success: json['success'] as bool?,
      message: json['message'] as String,
      attributes: json['attributes'],
    );

Map<String, dynamic> _$ApiResponseToJson(ApiResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'success': instance.success,
      'message': instance.message,
      'attributes': instance.attributes,
    };
