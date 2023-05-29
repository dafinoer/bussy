import 'package:equatable/equatable.dart';

class LocationModel extends Equatable {
  final double lat;
  final double lon;
  final String? address;

  const LocationModel({
    required this.lat,
    required this.lon,
    this.address,
  });

  @override
  List<Object?> get props => [
        lat,
        lon,
        address,
      ];
}
