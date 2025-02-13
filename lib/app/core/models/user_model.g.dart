// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      profileImageId: (json['profile_image_id'] as num?)?.toInt(),
      coverImageId: (json['cover_image_id'] as num?)?.toInt(),
      email: json['email'] as String?,
      emailVerifiedAt: json['email_verified_at'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'profile_image_id': instance.profileImageId,
      'cover_image_id': instance.coverImageId,
      'email': instance.email,
      'email_verified_at': instance.emailVerifiedAt,
    };
