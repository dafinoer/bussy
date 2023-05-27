// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:bussy/data/local/api_token_local.dart' as _i3;
import 'package:bussy/data/repositories/location_repository.dart' as _i5;
import 'package:bussy/domains/repository_impl/location_repository_impl.dart'
    as _i6;
import 'package:bussy/injector/network_modules.dart' as _i7;
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final networkModule = _$NetworkModule();
    await gh.factoryAsync<_i3.ApiTokenLocal>(
      () => _i3.ApiTokenLocal.openBox(),
      preResolve: true,
    );
    gh.factory<_i4.Dio>(() => networkModule.dio);
    gh.factory<_i5.LocationRepository>(() => _i6.LocationRepositoryImpl());
    return this;
  }
}

class _$NetworkModule extends _i7.NetworkModule {}
