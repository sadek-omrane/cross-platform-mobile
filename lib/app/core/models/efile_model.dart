import 'package:json_annotation/json_annotation.dart';
part 'efile_model.g.dart';

@JsonSerializable()
class EfileModel {
  int? id;
  String? name;
  String? path;
  int? size;
  String? type;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  EfileModel({
    this.id,
    this.name,
    this.path,
    this.size,
    this.type,
    this.createdAt,
    this.updatedAt,
  });

  factory EfileModel.fromJson(Map<String, dynamic> json) =>
      _$EfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$EfileModelToJson(this);
}
