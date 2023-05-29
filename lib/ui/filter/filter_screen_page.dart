import 'package:bussy/domains/model/filter_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/filters.dart';
import '../../presentations/filter/filter_search_cubit.dart';

part '_button_submit_filter.dart';

part '_filter_list_widget.dart';

class FilterScreenPage extends StatelessWidget {
  const FilterScreenPage({Key? key, this.filters}) : super(key: key);

  final Map<String, FilterModel>? filters;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Filter')),
      body: BlocProvider(
        create: (context) => FilterSearchCubit(
          filters ?? <String, FilterModel>{},
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _FilterListWidget(),
            Spacer(),
            _ButtonSubmitFilter(),
          ],
        ),
      ),
    );
  }
}
