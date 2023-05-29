import 'package:bussy/domains/model/company_model.dart';
import 'package:bussy/domains/model/location_model.dart';
import 'package:json_annotation/json_annotation.dart';

import 'coordinate_remote_model.dart';
import 'location_remote_model.dart';

part 'company_remote_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, createToJson: false)
class CompanyRemoteModel {
  final String id;
  final String name;
  final String imageUrl;
  final String phone;
  final String? displayPhone;

  @JsonKey(defaultValue: false)
  final bool isClosed;

  final String? price;

  @JsonKey(defaultValue: 0.0)
  final double rating;

  @JsonKey(defaultValue: 0)
  final int ratingCount;

  @JsonKey(defaultValue: <String>[])
  final List<String> photos;

  @JsonKey(name: 'coordinates')
  final CoordinateRemoteModel coordinateRemoteModel;

  @JsonKey(name: 'location')
  final LocationRemoteModel locationRemoteModel;

  CompanyRemoteModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.phone,
    this.displayPhone,
    this.isClosed = false,
    required this.price,
    required this.rating,
    required this.ratingCount,
    required this.coordinateRemoteModel,
    required this.locationRemoteModel,
    required this.photos,
  });

  factory CompanyRemoteModel.fromJson(Map<String, dynamic> json) =>
      _$CompanyRemoteModelFromJson(json);

  CompanyModel toCompany() => CompanyModel(
        id: id,
        name: name,
        phone: phone,
        displayPhone: displayPhone,
        priceSymbol: price,
        locationModel: LocationModel(
          lat: coordinateRemoteModel.lat,
          lon: coordinateRemoteModel.lon,
          address: locationRemoteModel.displayAddress.join(' '),
        ),
        imageCoverCompany: imageUrl,
        isClose: isClosed,
        rating: rating,
        reviewCount: ratingCount,
        photos: photos,
      );
}
