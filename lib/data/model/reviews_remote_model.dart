import 'package:json_annotation/json_annotation.dart';

import 'review_remote_model.dart';

part 'reviews_remote_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, createToJson: false)
class ReviewsRemoteModel {
  final List<ReviewRemoteModel> reviews;

  ReviewsRemoteModel(this.reviews);

  factory ReviewsRemoteModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewsRemoteModelFromJson(json);
}
