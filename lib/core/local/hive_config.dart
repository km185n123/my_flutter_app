import 'package:hive_flutter/hive_flutter.dart';
import '../../features/preferences/data/models/preference_model.dart';

class HiveConfig {
  static const String preferenceBoxName = 'preferences_v2';

  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(PreferenceModelImplAdapter());
    await Hive.openBox<PreferenceModel>(preferenceBoxName);
  }
}
