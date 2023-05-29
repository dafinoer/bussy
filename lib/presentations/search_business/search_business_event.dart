part of 'search_business_bloc.dart';

abstract class SearchBusinessEvent extends Equatable {
  const SearchBusinessEvent();
}

class SearchByLocation extends SearchBusinessEvent {
  final double lat;
  final double lon;

  const SearchByLocation({
    required this.lat,
    required this.lon,
  });

  @override
  List<Object?> get props => [lat, lon];
}

class SearchCompanies extends SearchBusinessEvent {
  const SearchCompanies(this.searchModel);

  final SearchModel searchModel;

  @override
  List<Object?> get props => [searchModel];
}