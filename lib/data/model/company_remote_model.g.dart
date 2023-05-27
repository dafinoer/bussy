// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_remote_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyRemoteModel _$CompanyRemoteModelFromJson(Map<String, dynamic> json) =>
    CompanyRemoteModel(
      id: json['id'] as String,
      name: json['name'] as String,
      imageUrl: json['image_url'] as String,
      isClose: json['is_close'] as bool? ?? false,
      price: json['price'] as String,
      rating: json['rating'] as int? ?? 0,
      ratingCount: json['rating_count'] as int? ?? 0,
      coordinateRemoteModel: CoordinateRemoteModel.fromJson(
          json['coordinates'] as Map<String, dynamic>),
      locationRemoteModel: LocationRemoteModel.fromJson(
          json['location'] as Map<String, dynamic>),
    );
