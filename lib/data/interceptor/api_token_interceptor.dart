import 'package:bussy/data/local/api_token_local.dart';
import 'package:dio/dio.dart';

class ApiTokenInterceptor extends Interceptor {
  final ApiTokenLocal apiTokenLocal;

  ApiTokenInterceptor(this.apiTokenLocal);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = apiTokenLocal.getApiToken();
    if (token != null) {
      options.headers.putIfAbsent('Authorization', () => "Bearer $token");
    } else {
      handler.reject(
        DioError.requestCancelled(
          requestOptions: options,
          reason: 'Set Api Key First',
        ),
      );
    }

    super.onRequest(options, handler);
  }
}
