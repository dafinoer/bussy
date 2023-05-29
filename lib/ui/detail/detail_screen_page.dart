import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../presentations/company_detail/company_detail_cubit.dart';

part '_header_picts.dart';

part '_title_text.dart';

part '_divider_widget.dart';

part '_review_widget.dart';

class DetailScreenPage extends StatelessWidget {
  const DetailScreenPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  static const route = '/detail';

  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => CompanyDetailCubit.create(id),
        child: const CustomScrollView(
          slivers: [
            _HeaderPicts(),
            _TitleTextWidget(),
            _DividerWidget(),
          ],
        ),
      ),
    );
  }
}
