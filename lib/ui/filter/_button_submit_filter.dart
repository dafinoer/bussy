part of 'filter_screen_page.dart';

class _ButtonSubmitFilter extends StatelessWidget {
  const _ButtonSubmitFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75.0,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: BlocBuilder<FilterSearchCubit, FilterSearchState>(
        builder: (context, state) {
          if (state is FilterList) {
            if (state.filters.isNotEmpty) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Total Filter: ',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        state.filters.length.toString(),
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {

                    },
                    child: const Text('Submit'),
                  ),
                ],
              );
            }
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
