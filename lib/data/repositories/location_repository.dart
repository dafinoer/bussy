import 'package:bussy/domains/model/location_model.dart';

abstract class LocationRepository {
  Future<bool> checkPermissionLocation();

  Future<LocationModel> getCurrentLocation();

  Future<String?> convertLatLonToHumanize(double lat, double lon);
}
