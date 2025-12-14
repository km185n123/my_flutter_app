import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/data/repositories/base_repository.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/character.dart';
import '../../domain/repositories/i_api_repository.dart';
import '../datasources/api_remote_datasource.dart';
import '../mappers/character_model_mapper.dart';

@Injectable(as: IApiRepository)
class ApiRepositoryImpl extends BaseRepository implements IApiRepository {
  final IApiRemoteDataSource _remoteDataSource;

  ApiRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<Character>>> getCharacters() {
    return performSafeCall(() async {
      final models = await _remoteDataSource.getCharacters();
      return models.map((e) => e.toEntity()).toList();
    });
  }

  @override
  Future<Either<Failure, List<Character>>> searchCharacters(String query) {
    return performSafeCall(() async {
      final models = await _remoteDataSource.searchCharacters(query);
      return models.map((e) => e.toEntity()).toList();
    });
  }

  @override
  Failure handleError(Object error) {
    if (error is DioException) {
      return ServerFailure(error.message ?? 'Server error');
    }
    return ServerFailure(error.toString());
  }
}
