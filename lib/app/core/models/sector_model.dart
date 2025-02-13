import 'package:json_annotation/json_annotation.dart';

part 'sector_model.g.dart';

@JsonSerializable()
class SectorModel {
  int? id;
  String? name;
  String? description;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;

  SectorModel({
    this.id,
    this.name,
    this.description,
    this.createdAt,
    this.updatedAt,
  });

  factory SectorModel.fromJson(Map<String, dynamic> json) =>
      _$SectorModelFromJson(json);

  Map<String, dynamic> toJson() => _$SectorModelToJson(this);
}
