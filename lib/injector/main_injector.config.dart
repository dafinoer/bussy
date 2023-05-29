// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:bussy/data/remote/businesses_client.dart' as _i3;
import 'package:bussy/data/remote/reviews_client.dart' as _i7;
import 'package:bussy/data/repositories/business_repository.dart' as _i8;
import 'package:bussy/data/repositories/location_repository.dart' as _i5;
import 'package:bussy/domains/repository_impl/business_repository_impl.dart'
    as _i9;
import 'package:bussy/domains/repository_impl/location_repository_impl.dart'
    as _i6;
import 'package:bussy/injector/network_modules.dart' as _i10;
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final networkModule = _$NetworkModule();
    gh.factory<_i3.BusinessesClient>(() => networkModule.businessClient);
    gh.factory<_i4.Dio>(() => networkModule.dio);
    gh.factory<_i5.LocationRepository>(() => _i6.LocationRepositoryImpl());
    gh.factory<_i7.ReviewsClient>(() => networkModule.reviewsClient);
    gh.factory<_i8.BusinessRepository>(
        () => _i9.BusinessRepositoryImpl(gh<_i3.BusinessesClient>()));
    return this;
  }
}

class _$NetworkModule extends _i10.NetworkModule {}
