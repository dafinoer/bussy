import 'package:json_annotation/json_annotation.dart';

part 'location_remote_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, createToJson: false)
class LocationRemoteModel {
  @JsonKey(name: 'display_address')
  final List<String> displayAddress;

  LocationRemoteModel(this.displayAddress);

  factory LocationRemoteModel.fromJson(Map<String, dynamic> json) =>
      _$LocationRemoteModelFromJson(json);
}
