import 'package:json_annotation/json_annotation.dart';

part 'review_remote_model.g.dart';

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class ReviewRemoteModel {
  final String text;
  final double rating;

  const ReviewRemoteModel(this.text, this.rating);

  factory ReviewRemoteModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewRemoteModelFromJson(json);
}
