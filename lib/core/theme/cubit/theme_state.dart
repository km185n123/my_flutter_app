part of 'theme_cubit.dart';

@freezed
class ThemeState with _$ThemeState {
  const factory ThemeState({
    @Default(AppThemeMode.system) AppThemeMode themeMode,
    @Default(false) bool isDarkMode,
  }) = _ThemeState;
}
