import 'package:bloc/bloc.dart';
import 'package:bussy/injector/main_injector.dart';
import 'package:equatable/equatable.dart';

import '../../data/repositories/location_repository.dart';

part 'location_permission_state.dart';

class LocationPermissionCubit extends Cubit<LocationPermissionState> {
  final LocationRepository locationRepository;

  static const _lat = 37.42223598456423;
  static const _lon = -122.0841004320195;

  LocationPermissionCubit(
    this.locationRepository,
  ) : super(const LocationPermissionInitial());

  factory LocationPermissionCubit.create() =>
      LocationPermissionCubit(getIt.get());

  void onRequestLocation() async {
    try {
      emit(const LocationPermissionSyncProcess());
      final isAllowPermission =
          await locationRepository.checkPermissionLocation();
      if (isAllowPermission) {
        final currentLocation = await locationRepository.getCurrentLocation();
        emit(
          LocationPermissionSuccess(
            currentLocation.lat,
            currentLocation.lon,
          ),
        );
      } else {
        emit(const LocationPermissionSuccess(_lat, _lon));
      }
    } catch (e) {
      emit(const LocationPermissionDefaultError());
    }
  }

  void addressLocation(double lat, double lon) async {
    try {
      emit(const LocationPermissionConvertProcessAddress());
      final address = await locationRepository.convertLatLonToHumanize(
        lat,
        lon,
      );
      emit(LocationPermissionAddress(address));
    } catch (e) {
      emit(const LocationPermissionFailureAddress());
    }
  }
}
