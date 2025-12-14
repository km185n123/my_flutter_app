import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failure.dart';
import '../entities/preference.dart';
import '../repositories/i_preference_repository.dart';

@injectable
class GetPreferencesUseCase {
  final IPreferenceRepository _repository;

  GetPreferencesUseCase(this._repository);

  Future<Either<Failure, List<Preference>>> call() {
    return _repository.getPreferences();
  }
}

@injectable
class AddPreferenceUseCase {
  final IPreferenceRepository _repository;

  AddPreferenceUseCase(this._repository);

  Future<Either<Failure, void>> call(Preference preference) {
    return _repository.addPreference(preference);
  }
}

@injectable
class DeletePreferenceUseCase {
  final IPreferenceRepository _repository;

  DeletePreferenceUseCase(this._repository);

  Future<Either<Failure, void>> call(int id) {
    return _repository.deletePreference(id);
  }
}
