import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/local/hive_config.dart';
import '../models/preference_model.dart';

abstract class IPreferenceLocalDataSource {
  Future<List<PreferenceModel>> getPreferences();
  Future<void> addPreference(PreferenceModel preference);
  Future<void> deletePreference(int id);
}

@Injectable(as: IPreferenceLocalDataSource)
class PreferenceLocalDataSource implements IPreferenceLocalDataSource {
  static const String boxName = HiveConfig.preferenceBoxName;

  @override
  Future<List<PreferenceModel>> getPreferences() async {
    final box = await Hive.openBox<PreferenceModel>(boxName);
    return box.values.toList();
  }

  @override
  Future<void> addPreference(PreferenceModel preference) async {
    final box = await Hive.openBox<PreferenceModel>(boxName);
    await box.put(preference.id, preference);
  }

  @override
  Future<void> deletePreference(int id) async {
    final box = await Hive.openBox<PreferenceModel>(boxName);
    await box.delete(id);
  }
}
