import 'package:json_annotation/json_annotation.dart';

part 'coordinate_remote_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, createToJson: false)
class CoordinateRemoteModel {
  @JsonKey(name: 'latitude')
  final double lat;

  @JsonKey(name: 'longitude')
  final double lon;

  CoordinateRemoteModel(this.lat, this.lon);

  factory CoordinateRemoteModel.fromJson(Map<String, dynamic> json) =>
      _$CoordinateRemoteModelFromJson(json);
}
