// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'efile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EfileModel _$EfileModelFromJson(Map<String, dynamic> json) => EfileModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      path: json['path'] as String?,
      size: (json['size'] as num?)?.toInt(),
      type: json['type'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$EfileModelToJson(EfileModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'path': instance.path,
      'size': instance.size,
      'type': instance.type,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
