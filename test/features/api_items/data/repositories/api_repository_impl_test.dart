import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:my_flutter_app/core/error/failure.dart';
import 'package:my_flutter_app/features/api_items/data/datasources/api_remote_datasource.dart';
import 'package:my_flutter_app/features/api_items/data/repositories/api_repository_impl.dart';

import '../../../../helpers/test_data.dart';
import 'api_repository_impl_test.mocks.dart';

@GenerateMocks([IApiRemoteDataSource])
void main() {
  late ApiRepositoryImpl repository;
  late MockIApiRemoteDataSource mockDataSource;

  setUp(() {
    mockDataSource = MockIApiRemoteDataSource();
    repository = ApiRepositoryImpl(mockDataSource);
  });

  group('ApiRepositoryImpl - getCharacters', () {
    test(
      'should return list of characters when datasource call is successful',
      () async {
        // Arrange
        when(
          mockDataSource.getCharacters(),
        ).thenAnswer((_) async => tCharacterModelList);

        // Act
        final result = await repository.getCharacters();

        // Assert
        expect(result, const Right(tCharacterList));
        verify(mockDataSource.getCharacters());
        verifyNoMoreInteractions(mockDataSource);
      },
    );

    test(
      'should return ServerFailure when datasource throws DioException',
      () async {
        // Arrange
        final dioException = DioException(
          requestOptions: RequestOptions(path: '/characters'),
          message: 'Network error',
        );
        when(mockDataSource.getCharacters()).thenThrow(dioException);

        // Act
        final result = await repository.getCharacters();

        // Assert
        expect(result.isLeft(), true);
        result.fold((failure) {
          expect(failure, isA<ServerFailure>());
          expect(failure.message, 'Network error');
        }, (_) => fail('Should return Left'));
        verify(mockDataSource.getCharacters());
        verifyNoMoreInteractions(mockDataSource);
      },
    );

    test(
      'should return ServerFailure when datasource throws generic exception',
      () async {
        // Arrange
        when(
          mockDataSource.getCharacters(),
        ).thenThrow(Exception('Unexpected error'));

        // Act
        final result = await repository.getCharacters();

        // Assert
        expect(result.isLeft(), true);
        result.fold((failure) {
          expect(failure, isA<ServerFailure>());
          expect(failure.message, contains('Exception: Unexpected error'));
        }, (_) => fail('Should return Left'));
        verify(mockDataSource.getCharacters());
        verifyNoMoreInteractions(mockDataSource);
      },
    );

    test(
      'should return empty list when datasource returns empty list',
      () async {
        // Arrange
        when(mockDataSource.getCharacters()).thenAnswer((_) async => []);

        // Act
        final result = await repository.getCharacters();

        // Assert
        expect(result, const Right([]));
        verify(mockDataSource.getCharacters());
        verifyNoMoreInteractions(mockDataSource);
      },
    );
  });

  group('ApiRepositoryImpl - searchCharacters', () {
    const tQuery = 'Rick';

    test(
      'should return list of characters when search is successful',
      () async {
        // Arrange
        when(
          mockDataSource.searchCharacters(tQuery),
        ).thenAnswer((_) async => tCharacterModelList);

        // Act
        final result = await repository.searchCharacters(tQuery);

        // Assert
        expect(result, const Right(tCharacterList));
        verify(mockDataSource.searchCharacters(tQuery));
        verifyNoMoreInteractions(mockDataSource);
      },
    );

    test(
      'should return ServerFailure when search throws DioException',
      () async {
        // Arrange
        final dioException = DioException(
          requestOptions: RequestOptions(path: '/characters'),
          message: 'Search failed',
        );
        when(mockDataSource.searchCharacters(tQuery)).thenThrow(dioException);

        // Act
        final result = await repository.searchCharacters(tQuery);

        // Assert
        expect(result.isLeft(), true);
        result.fold((failure) {
          expect(failure, isA<ServerFailure>());
          expect(failure.message, 'Search failed');
        }, (_) => fail('Should return Left'));
        verify(mockDataSource.searchCharacters(tQuery));
        verifyNoMoreInteractions(mockDataSource);
      },
    );

    test('should return empty list when no characters match query', () async {
      // Arrange
      when(mockDataSource.searchCharacters(tQuery)).thenAnswer((_) async => []);

      // Act
      final result = await repository.searchCharacters(tQuery);

      // Assert
      expect(result, const Right([]));
      verify(mockDataSource.searchCharacters(tQuery));
      verifyNoMoreInteractions(mockDataSource);
    });

    test('should pass query parameter correctly to datasource', () async {
      // Arrange
      const differentQuery = 'Morty';
      when(
        mockDataSource.searchCharacters(differentQuery),
      ).thenAnswer((_) async => tCharacterModelList);

      // Act
      await repository.searchCharacters(differentQuery);

      // Assert
      verify(mockDataSource.searchCharacters(differentQuery));
      verifyNoMoreInteractions(mockDataSource);
    });
  });
}
