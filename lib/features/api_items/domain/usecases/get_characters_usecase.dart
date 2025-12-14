import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failure.dart';
import '../entities/character.dart';
import '../repositories/i_api_repository.dart';

@injectable
class GetCharactersUseCase {
  final IApiRepository _repository;

  GetCharactersUseCase(this._repository);

  Future<Either<Failure, List<Character>>> call() {
    return _repository.getCharacters();
  }
}
