import 'package:bussy/components/endpoints.dart';
import 'package:bussy/data/remote/reviews_client.dart';
import 'package:dio/dio.dart';

import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../data/remote/businesses_client.dart';

final dioService = Dio(
  BaseOptions(
    baseUrl: Endpoints.baseUrl,
    connectTimeout: const Duration(milliseconds: 10000),
  ),
);

@module
abstract class NetworkModule {
  Dio get dio => dioService..interceptors.addAll([PrettyDioLogger()]);

  BusinessesClient get businessClient => BusinessesClient(dio);

  ReviewsClient get reviewsClient => ReviewsClient(dio);
}
