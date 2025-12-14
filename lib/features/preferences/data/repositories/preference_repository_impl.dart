import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/data/repositories/base_repository.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/preference.dart';
import '../../domain/repositories/i_preference_repository.dart';
import '../datasources/preference_local_datasource.dart';
import '../mappers/preference_entity_mapper.dart';
import '../models/preference_model.dart';

@Injectable(as: IPreferenceRepository)
class PreferenceRepositoryImpl extends BaseRepository
    implements IPreferenceRepository {
  final IPreferenceLocalDataSource _localDataSource;

  PreferenceRepositoryImpl(this._localDataSource);

  @override
  Future<Either<Failure, List<Preference>>> getPreferences() {
    return performSafeCall(() async {
      final models = await _localDataSource.getPreferences();
      return models.map((e) => e.toEntity()).toList();
    });
  }

  @override
  Future<Either<Failure, void>> addPreference(Preference preference) {
    return performSafeCall(() async {
      await _localDataSource.addPreference(preference.toModel());
    });
  }

  @override
  Future<Either<Failure, void>> deletePreference(int id) {
    return performSafeCall(() async {
      await _localDataSource.deletePreference(id);
    });
  }

  @override
  Failure handleError(Object error) {
    return CacheFailure(error.toString());
  }
}
