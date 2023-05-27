import 'package:bussy/data/repositories/business_repository.dart';
import 'package:bussy/domains/model/search_model.dart';
import 'package:bussy/injector/main_injector.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  await dotenv.load(fileName: "assets/.env");
  configureDependencies();

  group(
    'Search Remote Group',
    () {
      late BusinessRepository businessRepository;
      const double _lat = 40.72415942476694;
      const double _lon = -73.9926892922817;
      late SearchModel searchModel;

      setUp(() {
        businessRepository = getIt.get();
        searchModel = SearchModel(lat: _lat, lon: _lon);
      });

      test(
        'Test fetch remote text',
        () async {
          final result = await businessRepository.search(searchModel, limit: 3);
          expect(result.length, 3);
        },
      );
    },
  );
}
