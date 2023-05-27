import 'package:equatable/equatable.dart';

class LocationModel extends Equatable {
  final double lat;
  final double lon;

  const LocationModel({required this.lat, required this.lon});

  factory LocationModel.defaultLocation() => const LocationModel(
        lat: 40.72415942476694,
        lon: -73.9926892922817,
      );

  @override
  List<Object?> get props => [lat, lon];
}
