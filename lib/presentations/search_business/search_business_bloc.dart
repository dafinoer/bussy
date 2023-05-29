import 'package:bloc/bloc.dart';
import 'package:bussy/data/repositories/business_repository.dart';
import 'package:bussy/domains/model/company_model.dart';
import 'package:bussy/injector/main_injector.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

import '../../domains/model/search_model.dart';

part 'search_business_event.dart';

part 'search_business_state.dart';

class SearchBusinessBloc
    extends Bloc<SearchBusinessEvent, SearchBusinessState> {
  final BusinessRepository businessRepository;
  final List<CompanyModel> _items = <CompanyModel>[];
  final int _limit = 15;

  bool _isFullLoad = false;

  set setIsFullLoad(bool isFullLoad) => _isFullLoad = isFullLoad;

  bool get isFullLoad => _isFullLoad;

  int _indexLatestLoad = 0;

  factory SearchBusinessBloc.create() => SearchBusinessBloc(getIt.get());

  SearchBusinessBloc(this.businessRepository)
      : super(const SearchBusinessInitial()) {
    on<SearchByLocation>(
      (event, emit) async {
        try {
          emit(const SearchBusinessLoading());
          final result = await businessRepository.searchByLocation(
            event.lat,
            event.lon,
            limit: _limit,
          );
          _isFullLoad = _resultPaging(result.length) != 1;

          emit(SearchBusinessSuccess(result));
        } catch (e) {
          emit(const SearchBusinessFailure());
        }
      },
      transformer: (events, mapper) => events.switchMap(mapper),
    );
    on<SearchCompanies>(
      (event, emit) async {
        emit(const SearchBusinessLoading());
        final result = await businessRepository.search(
          event.searchModel,
          offset: _indexLatestLoad,
          limit: _limit,
        );
        _items.addAll(result);
        emit(SearchBusinessSuccess(result));
      },
      transformer: (events, mapper) => events
          .where((event) =>
              event.searchModel.searchText != null &&
              (event.searchModel.searchText?.isNotEmpty ?? false))
          .debounceTime(const Duration(milliseconds: 500))
          .switchMap(mapper),
    );
  }

  int _resultPaging(int length) => length % _limit;

  void onNewSearch(bool isFullLoad) {
    _isFullLoad = isFullLoad;
  }
}
