import 'package:fpdart/fpdart.dart';
import '../../error/failure.dart';

abstract class BaseRepository {
  Future<Either<Failure, T>> performSafeCall<T>(
    Future<T> Function() call,
  ) async {
    try {
      final result = await call();
      return Right(result);
    } catch (e) {
      return Left(handleError(e));
    }
  }

  Failure handleError(Object error);
}
