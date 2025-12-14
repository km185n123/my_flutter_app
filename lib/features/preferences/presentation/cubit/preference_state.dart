import 'package:equatable/equatable.dart';
import '../../domain/entities/preference.dart';

sealed class PreferenceState extends Equatable {
  const PreferenceState();

  @override
  List<Object> get props => [];
}

class PreferenceInitial extends PreferenceState {}

class PreferenceLoading extends PreferenceState {}

class PreferenceLoaded extends PreferenceState {
  final List<Preference> preferences;

  const PreferenceLoaded(this.preferences);

  @override
  List<Object> get props => [preferences];
}

class PreferenceError extends PreferenceState {
  final String message;

  const PreferenceError(this.message);

  @override
  List<Object> get props => [message];
}
