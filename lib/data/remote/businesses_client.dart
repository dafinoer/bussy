import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../components/endpoints.dart';
import '../model/company_search_remote_model.dart';

part 'businesses_client.g.dart';

@RestApi()
abstract class BusinessesClient {
  factory BusinessesClient(Dio dio, {String baseUrl}) = _BusinessesClient;

  @GET(Endpoints.search)
  Future<CompanySearchRemoteModel> search(
    @Queries() Map<String, dynamic> queries,
  );
}
