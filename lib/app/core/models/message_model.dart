import 'package:cross_platforme_mobile/app/core/models/chat_model.dart';
import 'package:cross_platforme_mobile/app/core/models/user_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'message_model.g.dart';

@JsonSerializable()
class MessageModel {
  int? id;
  ChatModel? chat;
  @JsonKey(name: 'reply_to_message')
  MessageModel? replyToMessage;
  @JsonKey(name: 'from_user')
  UserModel? fromUser;
  String? content;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  MessageModel({
    this.id,
    this.chat,
    this.replyToMessage,
    this.fromUser,
    this.content,
    this.createdAt,
    this.updatedAt,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);

  Map<String, dynamic> toJson() => _$MessageModelToJson(this);
}
