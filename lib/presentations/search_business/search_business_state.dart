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
  const SearchBusinessLoading();

  @override
  List<Object?> get props => [];
}

class SearchBusinessSuccess extends SearchBusinessState {
  final List<CompanyModel> companies;

  const SearchBusinessSuccess(this.companies);

  @override
  List<Object?> get props => [companies];
}

class SearchBusinessEmpty extends SearchBusinessState {
  const SearchBusinessEmpty();
  @override
  List<Object?> get props => [];
}

class SearchBusinessFailure extends SearchBusinessState {
  const SearchBusinessFailure();

  @override
  List<Object?> get props => [];
}
