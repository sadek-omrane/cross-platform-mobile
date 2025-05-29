import 'package:cross_platforme_mobile/app/core/models/sector_model.dart';
import 'package:cross_platforme_mobile/app/core/models/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'service_model.g.dart';

@JsonSerializable()
class ServiceModel {
  int? id;
  @JsonKey(name: 'created_by')
  UserModel? createdBy;
  String? name;
  String? description;
  String? price;
  @JsonKey(name: 'service_image_id')
  int? serviceImageId;
  @JsonKey(name: 'is_favorite')
  bool? isFavorite;
  @JsonKey(name: 'sector')
  SectorModel? sector;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;

  ServiceModel({
    this.id,
    this.createdBy,
    this.name,
    this.description,
    this.price,
    this.serviceImageId,
    this.isFavorite,
    this.sector,
    this.createdAt,
    this.updatedAt,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceModelFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceModelToJson(this);
}
