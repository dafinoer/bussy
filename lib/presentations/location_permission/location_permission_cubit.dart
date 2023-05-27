import 'package:bloc/bloc.dart';
import 'package:bussy/domains/model/location_model.dart';
import 'package:bussy/injector/main_injector.dart';
import 'package:equatable/equatable.dart';

import '../../data/repositories/location_repository.dart';

part 'location_permission_state.dart';

class LocationPermissionCubit extends Cubit<LocationPermissionState> {
  final LocationRepository locationRepository;

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
        emit(LocationPermissionSuccess(LocationModel(
          lat: currentLocation.lat,
          lon: currentLocation.lon,
        )));
      } else {
        emit(LocationPermissionSuccess(LocationModel.defaultLocation()));
      }
    } catch (e) {
      emit(const LocationPermissionDefaultError());
    }
  }

  void addressLocation(LocationModel locationModel) async {
    try {
      emit(const LocationPermissionConvertProcessAddress());
      final address =
          await locationRepository.convertLatLonToHumanize(locationModel);
      emit(LocationPermissionAddress(address));
    } catch (e) {
      emit(const LocationPermissionFailureAddress());
    }
  }
}
