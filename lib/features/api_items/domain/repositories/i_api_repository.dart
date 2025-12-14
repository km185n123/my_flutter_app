import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failure.dart';
import '../entities/character.dart';

abstract class IApiRepository {
  Future<Either<Failure, List<Character>>> getCharacters();
  Future<Either<Failure, List<Character>>> searchCharacters(String query);
}
