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
  final int maxLimitItem;

  int _leftIndex = 0;
  bool _isFullLoad = false;
  int _indexLatestLoad = 0;

  factory SearchBusinessBloc.create() => SearchBusinessBloc(getIt.get());

  SearchBusinessBloc(this.businessRepository, {this.maxLimitItem = 20})
      : super(const SearchBusinessInitial()) {
    _leftIndex = maxLimitItem;
    on<SearchByLocation>(
      (event, emit) async {
        try {
          emit(SearchBusinessLoading(isPagingLoading: event.isPaging));
          final result = await businessRepository.searchByLocation(
            event.lat,
            event.lon,
            offset: _indexLatestLoad,
            limit: _limit,
          );
          if (_isReachLimit(result.length)) {
            onAddItemToNextPage(result);
          } else {
            onAddReachLimit(result);
          }
          emit(SearchBusinessSuccess(_items));
        } catch (e) {
          emit(const SearchBusinessFailure());
        }
      },
      transformer: (events, mapper) => events
          .where((event) => !_isFullLoad)
          .flatMap(mapper, maxConcurrent: 1),
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

  bool _isReachLimit(int indexTotal) => indexTotal < _leftIndex;

  void onAddItemToNextPage(List<CompanyModel> companies) {
    _leftIndex -= companies.length;
    _isFullLoad = _resultPaging(companies.length) != 0;
    _indexLatestLoad += _limit;
    _items.addAll(companies);
  }

  void onAddReachLimit(List<CompanyModel> companies) {
    _isFullLoad = true;
    _items.addAll(companies.take(_leftIndex));
  }
}
