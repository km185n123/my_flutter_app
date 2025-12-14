import 'package:equatable/equatable.dart';
import 'package:my_flutter_app/features/api_items/domain/entities/character.dart';

sealed class ApiState extends Equatable {
  const ApiState();

  @override
  List<Object> get props => [];
}

class ApiInitial extends ApiState {}

class ApiLoading extends ApiState {}

class ApiSuccess extends ApiState {
  final List<Character> characters;

  const ApiSuccess(this.characters);

  @override
  List<Object> get props => [characters];
}

class ApiError extends ApiState {
  final String message;

  const ApiError(this.message);

  @override
  List<Object> get props => [message];
}
