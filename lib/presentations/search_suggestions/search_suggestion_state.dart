part of 'search_suggestion_bloc.dart';

abstract class SearchSuggestionState extends Equatable {
  const SearchSuggestionState();
}

class SearchSuggestionInitial extends SearchSuggestionState {
  @override
  List<Object> get props => [];
}

class CompanyListResult extends SearchSuggestionState {
  final List<String> suggestionWord;

  const CompanyListResult(this.suggestionWord);

  @override
  List<Object?> get props => [suggestionWord];
}
