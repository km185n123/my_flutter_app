import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failure.dart';
import '../entities/character.dart';
import '../repositories/i_api_repository.dart';

@injectable
class SearchCharactersUseCase {
  final IApiRepository _repository;

  SearchCharactersUseCase(this._repository);

  Future<Either<Failure, List<Character>>> call(String query) {
    return _repository.searchCharacters(query);
  }
}
