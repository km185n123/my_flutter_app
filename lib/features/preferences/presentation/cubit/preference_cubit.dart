import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:my_flutter_app/features/preferences/domain/entities/preference.dart';
import 'package:my_flutter_app/features/preferences/domain/usecases/preference_usecases.dart';
import 'preference_state.dart';

@injectable
class PreferenceCubit extends Cubit<PreferenceState> {
  final GetPreferencesUseCase _getPreferencesUseCase;
  final AddPreferenceUseCase _addPreferenceUseCase;
  final DeletePreferenceUseCase _deletePreferenceUseCase;

  PreferenceCubit(
    this._getPreferencesUseCase,
    this._addPreferenceUseCase,
    this._deletePreferenceUseCase,
  ) : super(PreferenceInitial());

  Future<void> loadPreferences() async {
    emit(PreferenceLoading());
    final result = await _getPreferencesUseCase();
    result.fold(
      (failure) => emit(PreferenceError(failure.message)),
      (preferences) => emit(PreferenceLoaded(preferences)),
    );
  }

  Future<void> addPreference(Preference preference) async {
    emit(PreferenceLoading());
    final result = await _addPreferenceUseCase(preference);
    result.fold(
      (failure) => emit(PreferenceError(failure.message)),
      (_) => loadPreferences(),
    );
  }

  Future<void> deletePreference(int id) async {
    emit(PreferenceLoading());
    final result = await _deletePreferenceUseCase(id);
    result.fold(
      (failure) => emit(PreferenceError(failure.message)),
      (_) => loadPreferences(),
    );
  }
}
