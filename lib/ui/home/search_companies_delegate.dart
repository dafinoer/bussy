import 'package:bussy/injector/main_injector.dart';
import 'package:bussy/widgets/card_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../domains/model/search_model.dart';
import '../../presentations/search_business/search_business_bloc.dart';
import '../../presentations/search_suggestions/search_suggestion_bloc.dart';

class SearchCompaniesDelegate extends SearchDelegate {
  late final SearchBusinessBloc searchBloc;
  late final SearchSuggestionBloc _searchSuggestionBloc;
  final double lat;
  final double lon;
  late SearchModel searchModel;

  SearchCompaniesDelegate(
    this.lat,
    this.lon,
  ) {
    searchBloc = SearchBusinessBloc(getIt.get());
    _searchSuggestionBloc = SearchSuggestionBloc();
    searchModel = SearchModel(lat: lat, lon: lon);
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, null),
      icon: const BackButtonIcon(),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    _searchSuggestionBloc.add(AddCompanySuggestion(query));
    searchBloc.add(
      SearchCompanies(SearchModel(lat: lat, lon: lon, searchText: query)),
    );

    return BlocBuilder<SearchBusinessBloc, SearchBusinessState>(
      bloc: searchBloc,
      builder: (context, state) {
        if (state is SearchBusinessLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is SearchBusinessSuccess) {
          if (state.companies.isEmpty) {
            return const Center(child: Text('Empty'));
          }

          return ListView.builder(
            itemCount: state.companies.length,
            itemBuilder: (context, index) => CardTile(
              title: state.companies[index].name,
              subtitle: state.companies[index].locationModel.address ?? '',
              urlImage: state.companies[index].imageCoverCompany ?? '',
              onTap: () => context.push('/detail/${state.companies[index].id}'),
            ),
          );
        }
        if (state is SearchBusinessFailure) return const Text('failure');

        return const SizedBox.shrink();
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    _searchSuggestionBloc.add(CompanyNameSearchSuggestion(query));

    return BlocBuilder<SearchSuggestionBloc, SearchSuggestionState>(
      bloc: _searchSuggestionBloc,
      builder: (context, state) {
        if (state is CompanyListResult) {
          return ListView.separated(
            itemBuilder: (context, index) => ListTile(
              onTap: () => query = state.suggestionWord[index],
              title: Text(
                state.suggestionWord[index],
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            separatorBuilder: (context, index) => const Divider(),
            itemCount: state.suggestionWord.length,
          );
        }

        return const SizedBox.shrink();
      },
    );
  }

  @override
  void close(BuildContext context, result) {
    searchBloc.close();
    _searchSuggestionBloc.close();
    super.close(context, result);
  }

  @override
  List<Widget>? buildActions(BuildContext context) => const [];
}

class FiltersChips extends ValueNotifier<List<String>> {
  FiltersChips(super.value);

  void onSetValues(List<String> items) {
    value = List<String>.of(items);
  }
}
