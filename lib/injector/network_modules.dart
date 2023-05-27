import 'package:bussy/components/endpoints.dart';
import 'package:bussy/injector/main_injector.dart';
import 'package:dio/dio.dart';

import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../data/interceptor/api_token_interceptor.dart';

final dioService = Dio(
  BaseOptions(
    baseUrl: Endpoints.baseUrl,
    connectTimeout: const Duration(milliseconds: 10000),
  ),
);

@module
abstract class NetworkModule {
  Dio get dio {
    final dio = dioService;
    dio.interceptors.addAll([
      PrettyDioLogger(),
      ApiTokenInterceptor(getIt.get()),
    ]);

    return dio;
  }
}
