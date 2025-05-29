import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  int? id;
  String? name;
  String? bio;
  String? phone;
  @JsonKey(name: 'profile_image_id')
  int? profileImageId;
  @JsonKey(name: 'cover_image_id')
  int? coverImageId;
  String? email;
  @JsonKey(name: 'email_verified_at')
  String? emailVerifiedAt;
  UserModel({
    this.id,
    this.name,
    this.bio,
    this.phone,
    this.profileImageId,
    this.coverImageId,
    this.email,
    this.emailVerifiedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
