// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sector_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SectorModel _$SectorModelFromJson(Map<String, dynamic> json) => SectorModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      description: json['description'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$SectorModelToJson(SectorModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
