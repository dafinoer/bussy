import 'package:json_annotation/json_annotation.dart';

part 'user_remote_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, createToJson: false)
class UserRemoteModel {
  final String imageUrl;
  final String name;

  UserRemoteModel(this.imageUrl, this.name);

  factory UserRemoteModel.fromJson(Map<String, dynamic> json) =>
      _$UserRemoteModelFromJson(json);
}
