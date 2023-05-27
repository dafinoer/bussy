import 'package:bussy/data/repositories/location_repository.dart';
import 'package:bussy/domains/model/location_model.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:geocoding/geocoding.dart';

@Injectable(as: LocationRepository)
class LocationRepositoryImpl implements LocationRepository {
  @override
  Future<LocationModel> getCurrentLocation() async {
    final currentLocation = await Geolocator.getCurrentPosition();

    return LocationModel(
      lat: currentLocation.latitude,
      lon: currentLocation.longitude,
    );
  }

  @override
  Future<bool> checkPermissionLocation() async {
    final isPermissionActive = await Geolocator.isLocationServiceEnabled();
    if (!isPermissionActive) return false;

    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      final requestResult = await Geolocator.requestPermission();

      return requestResult == LocationPermission.always ||
          requestResult == LocationPermission.whileInUse;
    } else if (permission == LocationPermission.deniedForever) {
      return false;
    }

    return true;
  }

  @override
  Future<String?> convertLatLonToHumanize(LocationModel locationModel) async {
    final locations = await placemarkFromCoordinates(
      locationModel.lat,
      locationModel.lon,
    );

    return locations.first.thoroughfare;
  }
}
