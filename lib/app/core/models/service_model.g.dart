// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceModel _$ServiceModelFromJson(Map<String, dynamic> json) => ServiceModel(
      id: (json['id'] as num?)?.toInt(),
      createdBy: json['created_by'] == null
          ? null
          : UserModel.fromJson(json['created_by'] as Map<String, dynamic>),
      name: json['name'] as String?,
      description: json['description'] as String?,
      price: json['price'] as String?,
      serviceImageId: (json['service_image_id'] as num?)?.toInt(),
      isFavorite: json['is_favorite'] as bool?,
      sector: json['sector'] == null
          ? null
          : SectorModel.fromJson(json['sector'] as Map<String, dynamic>),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$ServiceModelToJson(ServiceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_by': instance.createdBy,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'service_image_id': instance.serviceImageId,
      'is_favorite': instance.isFavorite,
      'sector': instance.sector,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
