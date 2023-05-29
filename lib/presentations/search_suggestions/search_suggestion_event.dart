part of 'search_suggestion_bloc.dart';

abstract class SearchSuggestionEvent extends Equatable {
  const SearchSuggestionEvent();
}

class CompanyNameSearchSuggestion extends SearchSuggestionEvent {
  final String title;

  const CompanyNameSearchSuggestion(this.title);

  @override
  List<Object?> get props => [title];
}

class AddCompanySuggestion extends SearchSuggestionEvent {
  final String title;

  const AddCompanySuggestion(this.title);

  @override
  List<Object?> get props => [title];
}
