import 'package:bussy/domains/model/company_model.dart';

import '../../domains/model/search_model.dart';

abstract class BusinessRepository {
  Future<List<CompanyModel>> search(
    SearchModel searchModel, {
    int offset = 0,
    int limit = 25,
  });

  Future<List<CompanyModel>> searchByLocation(
    double lat,
    double lon, {
    int offset = 0,
    int limit = 25,
  });

  Future<CompanyModel> getCompanyById(String id);
}
