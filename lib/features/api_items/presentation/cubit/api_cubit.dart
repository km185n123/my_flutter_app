import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:my_flutter_app/features/api_items/domain/usecases/get_characters_usecase.dart';
import 'package:my_flutter_app/features/api_items/domain/usecases/search_characters_usecase.dart';
import 'api_state.dart';

@injectable
class ApiCubit extends Cubit<ApiState> {
  final GetCharactersUseCase _getCharactersUseCase;
  final SearchCharactersUseCase _searchCharactersUseCase;

  ApiCubit(this._getCharactersUseCase, this._searchCharactersUseCase)
    : super(ApiInitial());

  Future<void> fetchCharacters() async {
    emit(ApiLoading());
    final result = await _getCharactersUseCase();
    result.fold(
      (failure) => emit(ApiError(failure.message)),
      (characters) => emit(ApiSuccess(characters)),
    );
  }

  Future<void> searchCharacters(String query) async {
    emit(ApiLoading());
    final result = await _searchCharactersUseCase(query);
    result.fold(
      (failure) => emit(ApiError(failure.message)),
      (characters) => emit(ApiSuccess(characters)),
    );
  }
}
