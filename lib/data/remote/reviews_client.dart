import 'package:bussy/components/endpoints.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../model/reviews_remote_model.dart';

part 'reviews_client.g.dart';

@RestApi()
abstract class ReviewsClient {
  factory ReviewsClient(Dio dio, {String baseUrl}) = _ReviewsClient;

  @GET(Endpoints.reviews)
  Future<ReviewsRemoteModel> reviews(
    @Header('Authorization') String authToken,
    @Path('businessID') String id,
  );
}
