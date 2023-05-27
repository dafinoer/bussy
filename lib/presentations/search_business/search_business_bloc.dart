import 'package:bloc/bloc.dart';
import 'package:bussy/data/repositories/business_repository.dart';
import 'package:bussy/domains/model/company_model.dart';
import 'package:bussy/injector/main_injector.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

part 'search_business_event.dart';

part 'search_business_state.dart';

class SearchBusinessBloc
    extends Bloc<SearchBusinessEvent, SearchBusinessState> {
  final BusinessRepository businessRepository;
  final List<CompanyModel> _items = List.empty();

  factory SearchBusinessBloc.create() => SearchBusinessBloc(getIt.get());

  SearchBusinessBloc(
    this.businessRepository,
  ) : super(const SearchBusinessInitial()) {
    on<SearchToServer>(
      (event, emit) {
        try {
          emit(const SearchBusinessLoading());
        } catch (e) {
          emit(const SearchBusinessFailure());
        }
      },
      transformer: (events, mapper) => events
          .debounceTime(const Duration(milliseconds: 500))
          .switchMap(mapper),
    );
    on<SearchByText>((event, emit) {
      emit(const SearchBusinessLoading());
      if (_items.isEmpty) {
        emit(const SearchBusinessEmpty());
      } else {
        final result = _items
            .where((company) => company.name.contains(event.text))
            .toList();
        emit(SearchBusinessSuccess(result));
      }
    });
  }
}
