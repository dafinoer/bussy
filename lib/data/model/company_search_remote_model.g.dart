// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_search_remote_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanySearchRemoteModel _$CompanySearchRemoteModelFromJson(
        Map<String, dynamic> json) =>
    CompanySearchRemoteModel(
      (json['businesses'] as List<dynamic>?)
              ?.map(
                  (e) => CompanyRemoteModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
