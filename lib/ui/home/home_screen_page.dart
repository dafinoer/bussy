import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../presentations/location_permission/location_permission_cubit.dart';

part '_appbar_content_widget.dart';

class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({Key? key}) : super(key: key);

  static const route = '/home';

  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LocationPermissionCubit.create()),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Bussy"),
          leadingWidth: 0.0,
          bottom: const PreferredSize(
            preferredSize: Size(double.infinity, 36.0),
            child: _AppBarContent(),
          ),
        ),
        body: const Center(
          child: Text("Lorem Ipsum"),
        ),
      ),
    );
  }
}
