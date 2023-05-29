part of 'search_business_bloc.dart';

abstract class SearchBusinessState extends Equatable {
  const SearchBusinessState();
}

class SearchBusinessInitial extends SearchBusinessState {
  const SearchBusinessInitial();

  @override
  List<Object> get props => [];
}

class SearchBusinessLoading extends SearchBusinessState {
  const SearchBusinessLoading({this.isPagingLoading = false});

  final bool isPagingLoading;

  @override
  List<Object?> get props => [isPagingLoading];
}

class SearchBusinessSuccess extends SearchBusinessState {
  final List<CompanyModel> companies;

  const SearchBusinessSuccess(this.companies);

  @override
  List<Object?> get props => [companies];
}

class SearchBusinessFailure extends SearchBusinessState {
  const SearchBusinessFailure();

  @override
  List<Object?> get props => [];
}
