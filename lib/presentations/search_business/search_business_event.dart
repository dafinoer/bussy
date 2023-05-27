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

class SearchToServer extends SearchBusinessEvent {
  final double? lat;
  final double? lon;

  const SearchToServer({
    this.lat,
    this.lon,
  });

  @override
  List<Object?> get props => [lat, lon];
}
