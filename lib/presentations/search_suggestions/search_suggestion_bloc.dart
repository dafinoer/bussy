import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

part 'search_suggestion_event.dart';

part 'search_suggestion_state.dart';

class SearchSuggestionBloc
    extends Bloc<SearchSuggestionEvent, SearchSuggestionState> {
  final Set<String> _companies = {};

  SearchSuggestionBloc() : super(SearchSuggestionInitial()) {
    on<CompanyNameSearchSuggestion>(
      (event, emit) {
        emit(SearchSuggestionInitial());
        final result = _companies
            .where((title) => title.contains(event.title))
            .toList(growable: false);
        emit(CompanyListResult(List.from(result)));
      },
    );

    on<AddCompanySuggestion>(
      (event, emit) => _companies.add(event.title),
      transformer: (events, mapper) => events
          .where((event) => event.title.isNotEmpty)
          .debounceTime(const Duration(milliseconds: 1000))
          .flatMap(mapper),
    );
  }
}
