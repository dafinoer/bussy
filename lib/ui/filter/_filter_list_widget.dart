part of 'filter_screen_page.dart';

class _FilterListWidget extends StatelessWidget {
  const _FilterListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: BlocBuilder<FilterSearchCubit, FilterSearchState>(
        buildWhen: (previous, current) => current is FilterList,
        builder: (context, state) {
          if (state is FilterList) {
            return Wrap(
              spacing: 6.0,
              runSpacing: 4.0,
              children: List.generate(
                filterCollection.length,
                (index) => ActionChip(
                  backgroundColor:
                      state.filters.containsKey(filterCollection[index]['type'])
                          ? Theme.of(context).colorScheme.tertiary
                          : null,
                  label: Text(
                    filterCollection[index]['title'] ?? '',
                    style: TextStyle(
                      color: state.filters
                              .containsKey(filterCollection[index]['type'])
                          ? Theme.of(context).colorScheme.onTertiary
                          : null,
                    ),
                  ),
                  onPressed: () => onSelectItem(context, index),
                ),
              ),
            );
          }

          return Wrap(
            spacing: 6.0,
            runSpacing: 4.0,
            children: List.generate(
              filterCollection.length,
              (index) => ActionChip(
                label: Text(filterCollection[index]['title'] ?? ''),
                onPressed: () => onSelectItem(context, index),
              ),
            ),
          );
        },
      ),
    );
  }

  void onSelectItem(BuildContext context, int index) {
    final typeValue = filterCollection[index]['type'];
    final filterName = filterCollection[index]['title'];
    if (typeValue != null && filterName != null) {
      context.read<FilterSearchCubit>().onSetFilter(typeValue, filterName);
    }
  }
}
