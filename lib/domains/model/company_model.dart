import 'package:bussy/domains/model/location_model.dart';
import 'package:equatable/equatable.dart';

import 'category_model.dart';

class CompanyModel extends Equatable {
  final String id;
  final String name;
  final String phone;
  final String priceSymbol;
  final LocationModel locationModel;
  final bool isClose;
  final double rating;
  final String? imageCoverCompany;
  final int reviewCount;
  final List<CategoryModel> categories;
  final String? displayPhone;

  const CompanyModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.priceSymbol,
    required this.locationModel,
    this.isClose = true,
    this.rating = 0.0,
    this.imageCoverCompany,
    this.reviewCount = 0,
    this.categories = const <CategoryModel>[],
    this.displayPhone,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        phone,
        priceSymbol,
        locationModel,
        isClose,
        rating,
        imageCoverCompany,
        reviewCount,
        displayPhone,
      ];
}
