import 'package:json_annotation/json_annotation.dart';

import 'coordinate_remote_model.dart';
import 'location_remote_model.dart';

part 'company_remote_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, createToJson: false)
class CompanyRemoteModel {
  final String id;
  final String name;
  final String imageUrl;
  @JsonKey(defaultValue: false)
  final bool isClose;

  final String price;

  @JsonKey(defaultValue: 0)
  final int rating;

  @JsonKey(defaultValue: 0)
  final int ratingCount;

  @JsonKey(name: 'coordinates')
  final CoordinateRemoteModel coordinateRemoteModel;

  @JsonKey(name: 'location')
  final LocationRemoteModel locationRemoteModel;

  CompanyRemoteModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    this.isClose = false,
    required this.price,
    required this.rating,
    required this.ratingCount,
    required this.coordinateRemoteModel,
    required this.locationRemoteModel,
  });

  factory CompanyRemoteModel.fromJson(Map<String, dynamic> json) =>
      _$CompanyRemoteModelFromJson(json);
}
