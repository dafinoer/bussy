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
  final List<CompanyModel> _items = List.empty();
  final int _limit = 15;
  bool _isFullLoad = false;
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
    on<SearchByText>(
      (event, emit) {
        emit(const SearchBusinessLoading());
        if (event.text.isEmpty && _items.isEmpty) {
          emit(const SearchBusinessEmpty());
        } else if (event.text.isEmpty) {
          emit(SearchBusinessSuccess(_items));
        } else {
          final result = _items
              .where((company) => company.name.contains(event.text))
              .toList();
          emit(SearchBusinessByName(result));
        }
      },
      transformer: (events, mapper) => events.debounceTime(
        const Duration(milliseconds: 500),
      ),
    );

    on<PagingSearchCompanies>((event, emit) async {
      try {
        if (!_isFullLoad) {
          emit(const SearchBusinessLoading());
          final result = await businessRepository.search(
            event.searchModel,
            offset: _indexLatestLoad,
            limit: _limit,
          );
          if (result.isNotEmpty) {
            _isFullLoad = _resultPaging(result.length) != 1;
            _items.addAll(result);
            emit(SearchBusinessSuccess(_items));
          } else {
            emit(const SearchBusinessLoading());
          }
        }
      } catch (e) {
        emit(const SearchBusinessFailure());
      }
    });
  }

  int _resultPaging(int length) => length % _limit;

  void onNewSearch(bool isFullLoad) {
    _isFullLoad = isFullLoad;
  }
}
