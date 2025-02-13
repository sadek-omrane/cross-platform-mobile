import 'package:cross_platforme_mobile/app/core/models/message_model.dart';
import 'package:cross_platforme_mobile/app/core/models/user_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'chat_model.g.dart';

@JsonSerializable()
class ChatModel {
  int? id;
  @JsonKey(name: 'created_by')
  UserModel? createdBy;
  List<UserModel>? users;
  List<MessageModel>? messages;
  @JsonKey(name: 'last_message')
  MessageModel? lastMessage;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;

  ChatModel({
    this.id,
    this.createdBy,
    this.users,
    this.messages,
    this.lastMessage,
    this.createdAt,
    this.updatedAt,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) =>
      _$ChatModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChatModelToJson(this);

  UserModel get recipient {
    return users!.firstWhere((element) => element.id != createdBy!.id!);
  }
}
