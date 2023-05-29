part of 'filter_search_cubit.dart';

abstract class FilterSearchState extends Equatable {
  const FilterSearchState();
}

class FilterSearchInitial extends FilterSearchState {
  @override
  List<Object?> get props => [];
}

class FilterSyncProcess extends FilterSearchState {
  const FilterSyncProcess();

  @override
  List<Object?> get props => [];
}

class FilterList extends FilterSearchState {
  final Map<String, FilterModel> filters;

  const FilterList(this.filters);

  @override
  List<Object?> get props => [filters];
}



