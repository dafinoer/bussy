part of 'search_business_bloc.dart';

abstract class SearchBusinessEvent extends Equatable {
  const SearchBusinessEvent();
}

class SearchByText extends SearchBusinessEvent {
  final String text;

  const SearchByText(this.text);

  @override
  List<Object?> get props => [text];
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

class PagingSearchCompanies extends SearchBusinessEvent {
  const PagingSearchCompanies(this.searchModel);

  final SearchModel searchModel;

  @override
  List<Object?> get props => [searchModel];
}
