import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failure.dart';
import '../entities/preference.dart';

abstract class IPreferenceRepository {
  Future<Either<Failure, List<Preference>>> getPreferences();
  Future<Either<Failure, void>> addPreference(Preference preference);
  Future<Either<Failure, void>> deletePreference(int id);
}
