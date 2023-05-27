part of 'location_permission_cubit.dart';

abstract class LocationPermissionState extends Equatable {
  const LocationPermissionState();
}

class LocationPermissionInitial extends LocationPermissionState {
  const LocationPermissionInitial();

  @override
  List<Object?> get props => [];
}

class LocationPermissionConvertProcessAddress extends LocationPermissionState {
  const LocationPermissionConvertProcessAddress();

  @override
  List<Object?> get props => [];
}

class LocationPermissionSyncProcess extends LocationPermissionState {
  const LocationPermissionSyncProcess();

  @override
  List<Object?> get props => [];
}

class LocationPermissionSuccess extends LocationPermissionState {
  const LocationPermissionSuccess(this.locationModel);

  final LocationModel locationModel;

  @override
  List<Object?> get props => [locationModel];
}

class LocationPermissionAddress extends LocationPermissionState {
  final String? address;

  const LocationPermissionAddress(this.address);

  @override
  List<Object?> get props => [address];
}

class LocationPermissionFailureAddress extends LocationPermissionState {
  const LocationPermissionFailureAddress();

  @override
  List<Object?> get props => [];
}

class LocationPermissionDefaultError extends LocationPermissionState {
  const LocationPermissionDefaultError();

  @override
  List<Object?> get props => [];
}
