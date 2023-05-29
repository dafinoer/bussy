import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../components/endpoints.dart';
import '../model/company_remote_model.dart';
import '../model/company_search_remote_model.dart';

part 'businesses_client.g.dart';

@RestApi()
abstract class BusinessesClient {
  factory BusinessesClient(Dio dio, {String baseUrl}) = _BusinessesClient;

  /// TODO : reafactor authorization to interceptor
  @GET(Endpoints.search)
  Future<CompanySearchRemoteModel> search(
    @Header('Authorization') String authToken,
    @Queries() Map<String, dynamic> queries,
  );

  /// TODO : reafactor authorization to interceptor
  @GET(Endpoints.search)
  Future<CompanySearchRemoteModel> searchCompanyByLocation(
    @Header('Authorization') String authToken,
    @Query('latitude') double lat,
    @Query('longitude') double lon,
    @Query('offset') int offset,
    @Query('limit') int limit,
  );

  /// TODO : reafactor authorization to interceptor
  @GET('${Endpoints.businessById}/{business_id_or_alias}')
  Future<CompanyRemoteModel> companyById(
    @Header('Authorization') String authToken,
    @Path('business_id_or_alias') String id,
  );
}
