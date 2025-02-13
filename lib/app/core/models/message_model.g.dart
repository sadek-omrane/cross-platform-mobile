// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageModel _$MessageModelFromJson(Map<String, dynamic> json) => MessageModel(
      id: (json['id'] as num?)?.toInt(),
      chat: json['chat'] == null
          ? null
          : ChatModel.fromJson(json['chat'] as Map<String, dynamic>),
      replyToMessage: json['reply_to_message'] == null
          ? null
          : MessageModel.fromJson(
              json['reply_to_message'] as Map<String, dynamic>),
      fromUser: json['from_user'] == null
          ? null
          : UserModel.fromJson(json['from_user'] as Map<String, dynamic>),
      content: json['content'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$MessageModelToJson(MessageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'chat': instance.chat,
      'reply_to_message': instance.replyToMessage,
      'from_user': instance.fromUser,
      'content': instance.content,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
