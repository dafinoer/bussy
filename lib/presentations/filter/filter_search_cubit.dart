import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domains/model/filter_model.dart';

part 'filter_search_state.dart';

class FilterSearchCubit extends Cubit<FilterSearchState> {
  final Map<String, FilterModel> _filterList;

  FilterSearchCubit(this._filterList) : super(FilterSearchInitial());

  void onSetFilter(String idKey, String value) {
    emit(const FilterSyncProcess());
    if (_filterList.containsKey(idKey)) {
      _filterList.remove(idKey);
    } else {
      _filterList.putIfAbsent(idKey, () => FilterModel(idKey, value));
    }

    emit(FilterList(_filterList));
  }
}
