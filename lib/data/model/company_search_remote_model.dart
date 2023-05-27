import 'package:json_annotation/json_annotation.dart';

import 'company_remote_model.dart';

part 'company_search_remote_model.g.dart';

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class CompanySearchRemoteModel {
  @JsonKey(
    name: 'businesses',
    defaultValue: <CompanyRemoteModel>[],
  )
  final List<CompanyRemoteModel> businessCompanies;

  CompanySearchRemoteModel(this.businessCompanies);

  factory CompanySearchRemoteModel.fromJson(Map<String, dynamic> json) =>
      _$CompanySearchRemoteModelFromJson(json);
}
