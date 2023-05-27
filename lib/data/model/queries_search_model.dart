import 'package:json_annotation/json_annotation.dart';

part 'queries_search_model.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  createPerFieldToJson: false,
  includeIfNull: false,
)
class QueriesSearchModel {
  final String? location;
  @JsonKey(name: 'latitude')
  final double? lat;

  @JsonKey(name: 'longitude')
  final double? lon;

  @JsonKey(name: 'term')
  final String? searchText;

  final List<String>? price;

  final List<String>? categories;

  final List<String>? attributes;

  final int limit;

  final int offset;

  QueriesSearchModel({
    this.location,
    this.lon,
    this.lat,
    this.searchText,
    this.categories,
    this.attributes,
    this.price,
    this.limit = 20,
    this.offset = 0,
  });

  Map<String, dynamic> get toJson => _$QueriesSearchModelToJson(this);
}
