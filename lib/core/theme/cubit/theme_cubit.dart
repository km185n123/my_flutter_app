import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import '../app_theme_mode.dart';

part 'theme_state.dart';
part 'theme_cubit.freezed.dart';

class ThemeCubit extends Cubit<ThemeState> {
  static const String _themeBoxName = 'theme_settings';
  static const String _themeModeKey = 'theme_mode';

  late Box<int> _themeBox;

  ThemeCubit() : super(const ThemeState());

  Future<void> initialize() async {
    try {
      _themeBox = await Hive.openBox<int>(_themeBoxName);
      await _loadSavedTheme();
    } catch (e) {
      debugPrint('Error initializing ThemeCubit: $e');
    }
  }

  Future<void> _loadSavedTheme() async {
    try {
      final savedModeIndex = _themeBox.get(_themeModeKey);
      if (savedModeIndex != null &&
          savedModeIndex < AppThemeMode.values.length) {
        final savedMode = AppThemeMode.values[savedModeIndex];
        emit(state.copyWith(themeMode: savedMode));
      }
    } catch (e) {
      debugPrint('Error loading saved theme: $e');
    }
  }

  Future<void> setThemeMode(AppThemeMode mode) async {
    emit(state.copyWith(themeMode: mode));
    await _saveThemeMode(mode);
  }

  Future<void> toggleTheme() async {
    final newMode = state.themeMode == AppThemeMode.light
        ? AppThemeMode.dark
        : AppThemeMode.light;
    await setThemeMode(newMode);
  }

  void updateSystemBrightness(Brightness brightness) {
    final isDark = brightness == Brightness.dark;
    if (state.isDarkMode != isDark) {
      emit(state.copyWith(isDarkMode: isDark));
    }
  }

  Future<void> _saveThemeMode(AppThemeMode mode) async {
    try {
      await _themeBox.put(_themeModeKey, mode.index);
    } catch (e) {
      debugPrint('Error saving theme mode: $e');
    }
  }

  ThemeMode get effectiveThemeMode {
    switch (state.themeMode) {
      case AppThemeMode.light:
        return ThemeMode.light;
      case AppThemeMode.dark:
        return ThemeMode.dark;
      case AppThemeMode.system:
        return ThemeMode.system;
    }
  }

  @override
  Future<void> close() {
    _themeBox.close();
    return super.close();
  }
}
