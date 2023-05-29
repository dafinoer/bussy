import 'package:bussy/injector/main_injector.dart';
import 'package:bussy/presentations/search_business/search_business_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../presentations/location_permission/location_permission_cubit.dart';
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

  @override
  void initState() {
    super.initState();
    locationPermissionCubit = LocationPermissionCubit.create();
    searchBusinessBloc = SearchBusinessBloc(getIt.get());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    locationPermissionCubit.onRequestLocation();
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
            preferredSize: Size(double.infinity, 36.0),
            child: _AppBarContent(),
          ),
          actions: [
            BlocBuilder<LocationPermissionCubit, LocationPermissionState>(
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
        body: Text('test'),
      ),
    );
  }
}
