// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'queries_search_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QueriesSearchModel _$QueriesSearchModelFromJson(Map<String, dynamic> json) =>
    QueriesSearchModel(
      location: json['location'] as String?,
      lon: (json['longitude'] as num?)?.toDouble(),
      lat: (json['latitude'] as num?)?.toDouble(),
      searchText: json['term'] as String?,
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      attributes: (json['attributes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      price:
          (json['price'] as List<dynamic>?)?.map((e) => e as String).toList(),
      limit: json['limit'] as int? ?? 20,
      offset: json['offset'] as int? ?? 0,
    );

Map<String, dynamic> _$QueriesSearchModelToJson(QueriesSearchModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('location', instance.location);
  writeNotNull('latitude', instance.lat);
  writeNotNull('longitude', instance.lon);
  writeNotNull('term', instance.searchText);
  writeNotNull('price', instance.price);
  writeNotNull('categories', instance.categories);
  writeNotNull('attributes', instance.attributes);
  val['limit'] = instance.limit;
  val['offset'] = instance.offset;
  return val;
}
