import 'package:bussy/injector/main_injector.dart';
import 'package:bussy/presentations/search_business/search_business_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

import '../../presentations/location_permission/location_permission_cubit.dart';
import '../../widgets/card_tile.dart';
import 'search_companies_delegate.dart';

part '_appbar_content_widget.dart';

class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({Key? key}) : super(key: key);

  static const route = '/home';

  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  late final LocationPermissionCubit locationPermissionCubit;
  late final SearchBusinessBloc searchBusinessBloc;
  late final ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    locationPermissionCubit = LocationPermissionCubit.create();
    searchBusinessBloc = SearchBusinessBloc(getIt.get(), maxLimitItem: 50);
    scrollController = ScrollController();
    scrollController.addListener(onListenerScroll);
  }

  void onListenerScroll() {
    final position = scrollController.position;
    if (position.pixels == position.maxScrollExtent) onLocationState();
  }

  void onLocationState() {
    searchBusinessBloc.add(SearchByLocation(
      lat: locationPermissionCubit.lat,
      lon: locationPermissionCubit.lon,
      isPaging: true,
    ));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    locationPermissionCubit.onRequestLocation();
  }

  @override
  void dispose() {
    scrollController.dispose();
    locationPermissionCubit.close();
    searchBusinessBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: locationPermissionCubit),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Bussy"),
          leadingWidth: 0.0,
          bottom: const PreferredSize(
            preferredSize: Size(double.infinity, kToolbarHeight),
            child: _AppBarContent(),
          ),
          actions: [
            BlocConsumer<LocationPermissionCubit, LocationPermissionState>(
              listener: (context, state) {
                if (state is LocationPermissionSuccess) {
                  searchBusinessBloc.add(
                    SearchByLocation(lat: state.lat, lon: state.lon),
                  );
                }
              },
              buildWhen: (previous, current) =>
                  current is LocationPermissionSuccess,
              bloc: locationPermissionCubit,
              builder: (context, state) {
                if (state is LocationPermissionSuccess) {
                  return IconButton(
                    onPressed: () => showSearch(
                      context: context,
                      delegate: SearchCompaniesDelegate(
                        state.lat,
                        state.lon,
                      ),
                    ),
                    icon: const Icon(Icons.search),
                  );
                }

                return IconButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('No Location Detection')),
                    );
                  },
                  icon: const Icon(Icons.search),
                );
              },
            ),
          ],
        ),
        body: SizedBox.expand(
          child: BlocBuilder<SearchBusinessBloc, SearchBusinessState>(
            bloc: searchBusinessBloc,
            buildWhen: (previous, current) {
              if (current is SearchBusinessLoading) {
                return !current.isPagingLoading;
              }

              return true;
            },
            builder: (context, state) {
              if (state is SearchBusinessLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is SearchBusinessSuccess) {
                return ListView.builder(
                  padding: EdgeInsets.zero,
                  controller: scrollController,
                  itemCount: state.companies.length,
                  itemBuilder: (context, index) {
                    return CardTile(
                      title: state.companies[index].name,
                      subtitle:
                          state.companies[index].locationModel.address ?? '',
                      urlImage: state.companies[index].imageCoverCompany ?? '',
                      onTap: () =>
                          context.push('/detail/${state.companies[index].id}'),
                    );
                  },
                );
              }

              if (state is SearchBusinessFailure) {
                return const Center(child: Text('Failure'));
              }

              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
