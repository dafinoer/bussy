// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reviews_remote_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewsRemoteModel _$ReviewsRemoteModelFromJson(Map<String, dynamic> json) =>
    ReviewsRemoteModel(
      (json['reviews'] as List<dynamic>)
          .map((e) => ReviewRemoteModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
