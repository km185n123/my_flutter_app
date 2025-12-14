// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/api_items/data/datasources/api_remote_datasource.dart'
    as _i1033;
import '../../features/api_items/data/repositories/api_repository_impl.dart'
    as _i686;
import '../../features/api_items/domain/repositories/i_api_repository.dart'
    as _i401;
import '../../features/api_items/domain/usecases/get_characters_usecase.dart'
    as _i811;
import '../../features/api_items/domain/usecases/search_characters_usecase.dart'
    as _i1017;
import '../../features/api_items/presentation/cubit/api_cubit.dart' as _i26;
import '../../features/preferences/data/datasources/preference_local_datasource.dart'
    as _i832;
import '../../features/preferences/data/repositories/preference_repository_impl.dart'
    as _i1041;
import '../../features/preferences/domain/repositories/i_preference_repository.dart'
    as _i1059;
import '../../features/preferences/domain/usecases/preference_usecases.dart'
    as _i445;
import '../../features/preferences/presentation/cubit/preference_cubit.dart'
    as _i456;
import '../config/app_config.dart' as _i650;
import '../network/api_client.dart' as _i557;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i832.IPreferenceLocalDataSource>(
        () => _i832.PreferenceLocalDataSource());
    gh.singleton<_i557.ApiClient>(() => _i557.ApiClient(gh<_i650.AppConfig>()));
    gh.factory<_i1033.IApiRemoteDataSource>(
        () => _i1033.ApiRemoteDataSource(gh<_i557.ApiClient>()));
    gh.factory<_i1059.IPreferenceRepository>(() =>
        _i1041.PreferenceRepositoryImpl(
            gh<_i832.IPreferenceLocalDataSource>()));
    gh.factory<_i445.GetPreferencesUseCase>(
        () => _i445.GetPreferencesUseCase(gh<_i1059.IPreferenceRepository>()));
    gh.factory<_i445.AddPreferenceUseCase>(
        () => _i445.AddPreferenceUseCase(gh<_i1059.IPreferenceRepository>()));
    gh.factory<_i445.DeletePreferenceUseCase>(() =>
        _i445.DeletePreferenceUseCase(gh<_i1059.IPreferenceRepository>()));
    gh.factory<_i401.IApiRepository>(
        () => _i686.ApiRepositoryImpl(gh<_i1033.IApiRemoteDataSource>()));
    gh.factory<_i811.GetCharactersUseCase>(
        () => _i811.GetCharactersUseCase(gh<_i401.IApiRepository>()));
    gh.factory<_i1017.SearchCharactersUseCase>(
        () => _i1017.SearchCharactersUseCase(gh<_i401.IApiRepository>()));
    gh.factory<_i26.ApiCubit>(() => _i26.ApiCubit(
          gh<_i811.GetCharactersUseCase>(),
          gh<_i1017.SearchCharactersUseCase>(),
        ));
    gh.factory<_i456.PreferenceCubit>(() => _i456.PreferenceCubit(
          gh<_i445.GetPreferencesUseCase>(),
          gh<_i445.AddPreferenceUseCase>(),
          gh<_i445.DeletePreferenceUseCase>(),
        ));
    return this;
  }
}
