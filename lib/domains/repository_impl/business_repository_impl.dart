import 'package:bussy/data/repositories/business_repository.dart';
import 'package:bussy/domains/model/company_model.dart';
import 'package:bussy/domains/model/search_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';

import '../../data/model/queries_search_model.dart';
import '../../data/remote/businesses_client.dart';

@Injectable(as: BusinessRepository)
class BusinessRepositoryImpl implements BusinessRepository {
  final BusinessesClient businessesClient;
  late String _token;

  BusinessRepositoryImpl(this.businessesClient) {
    _token = 'Bearer ${dotenv.get('APIKEY')}';
  }

  @override
  Future<List<CompanyModel>> search(
    SearchModel searchModel, {
    int offset = 0,
    int limit = 25,
  }) async {
    final searchQuery = QueriesSearchModel.fromSearchModel(
      searchModel,
      offset,
      limit,
    );
    final result = await businessesClient.search(_token, searchQuery.toJson);
    final toCompanyModel = result.businessCompanies
        .map((e) => e.toCompany())
        .toList(growable: false);

    return toCompanyModel;
  }

  @override
  Future<List<CompanyModel>> searchByLocation(
    double lat,
    double lon, {
    int offset = 0,
    int limit = 25,
  }) async {
    final result = await businessesClient.searchCompanyByLocation(
      _token,
      lat,
      lon,
      offset,
      limit,
    );
    final toCompanyModel = result.businessCompanies
        .map((e) => e.toCompany())
        .toList(growable: false);

    return toCompanyModel;
  }
}
