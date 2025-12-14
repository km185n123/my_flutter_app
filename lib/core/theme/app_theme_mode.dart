import 'package:hive/hive.dart';

part 'app_theme_mode.g.dart';

@HiveType(typeId: 10)
enum AppThemeMode {
  @HiveField(0)
  light,

  @HiveField(1)
  dark,

  @HiveField(2)
  system,
}

extension AppThemeModeExtension on AppThemeMode {
  String get displayName {
    switch (this) {
      case AppThemeMode.light:
        return 'Claro';
      case AppThemeMode.dark:
        return 'Oscuro';
      case AppThemeMode.system:
        return 'Sistema';
    }
  }
}
