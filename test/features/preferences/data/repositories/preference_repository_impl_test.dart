import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:my_flutter_app/features/preferences/data/datasources/preference_local_datasource.dart';
import 'package:my_flutter_app/features/preferences/data/repositories/preference_repository_impl.dart';
import 'package:fpdart/fpdart.dart';
import 'package:my_flutter_app/core/error/failure.dart';

import '../../../../helpers/test_data.dart';
import 'preference_repository_impl_test.mocks.dart';

@GenerateMocks([IPreferenceLocalDataSource])
void main() {
  late PreferenceRepositoryImpl repository;
  late MockIPreferenceLocalDataSource mockDataSource;

  setUp(() {
    mockDataSource = MockIPreferenceLocalDataSource();
    repository = PreferenceRepositoryImpl(mockDataSource);
  });

  group('PreferenceRepositoryImpl - getPreferences', () {
    test(
      'should return list of preferences when datasource call is successful',
      () async {
        // Arrange
        when(
          mockDataSource.getPreferences(),
        ).thenAnswer((_) async => tPreferenceModelList);

        // Act
        final result = await repository.getPreferences();

        // Assert
        expect(result.isRight(), true);
        result.fold(
          (_) => fail('Should return Right'),
          (preferences) => expect(preferences, tPreferenceList),
        );
        verify(mockDataSource.getPreferences());
        verifyNoMoreInteractions(mockDataSource);
      },
    );

    test(
      'should return CacheFailure when datasource throws exception',
      () async {
        // Arrange
        when(
          mockDataSource.getPreferences(),
        ).thenThrow(Exception('Cache error'));

        // Act
        final result = await repository.getPreferences();

        // Assert
        expect(result.isLeft(), true);
        result.fold((failure) {
          expect(failure, isA<CacheFailure>());
          expect(failure.message, contains('Exception: Cache error'));
        }, (_) => fail('Should return Left'));
        verify(mockDataSource.getPreferences());
        verifyNoMoreInteractions(mockDataSource);
      },
    );

    test(
      'should return empty list when datasource returns empty list',
      () async {
        // Arrange
        when(mockDataSource.getPreferences()).thenAnswer((_) async => []);

        // Act
        final result = await repository.getPreferences();

        // Assert
        expect(result.isRight(), true);
        result.fold(
          (_) => fail('Should return Right'),
          (preferences) => expect(preferences, []),
        );
        verify(mockDataSource.getPreferences());
        verifyNoMoreInteractions(mockDataSource);
      },
    );
  });

  group('PreferenceRepositoryImpl - addPreference', () {
    test(
      'should add preference successfully when datasource call succeeds',
      () async {
        // Arrange
        when(
          mockDataSource.addPreference(tPreferenceModel),
        ).thenAnswer((_) async => Future.value());

        // Act
        final result = await repository.addPreference(tPreference);

        // Assert
        expect(result, const Right(null));
        verify(mockDataSource.addPreference(tPreferenceModel));
        verifyNoMoreInteractions(mockDataSource);
      },
    );

    test(
      'should return CacheFailure when datasource throws exception',
      () async {
        // Arrange
        when(
          mockDataSource.addPreference(any),
        ).thenThrow(Exception('Failed to add'));

        // Act
        final result = await repository.addPreference(tPreference);

        // Assert
        expect(result.isLeft(), true);
        result.fold((failure) {
          expect(failure, isA<CacheFailure>());
          expect(failure.message, contains('Exception: Failed to add'));
        }, (_) => fail('Should return Left'));
      },
    );

    test('should convert entity to model before calling datasource', () async {
      // Arrange
      when(
        mockDataSource.addPreference(any),
      ).thenAnswer((_) async => Future.value());

      // Act
      await repository.addPreference(tPreference);

      // Assert
      verify(mockDataSource.addPreference(tPreferenceModel));
    });
  });

  group('PreferenceRepositoryImpl - deletePreference', () {
    const tId = 1;

    test(
      'should delete preference successfully when datasource call succeeds',
      () async {
        // Arrange
        when(
          mockDataSource.deletePreference(tId),
        ).thenAnswer((_) async => Future.value());

        // Act
        final result = await repository.deletePreference(tId);

        // Assert
        expect(result, const Right(null));
        verify(mockDataSource.deletePreference(tId));
        verifyNoMoreInteractions(mockDataSource);
      },
    );

    test(
      'should return CacheFailure when datasource throws exception',
      () async {
        // Arrange
        when(
          mockDataSource.deletePreference(tId),
        ).thenThrow(Exception('Failed to delete'));

        // Act
        final result = await repository.deletePreference(tId);

        // Assert
        expect(result.isLeft(), true);
        result.fold((failure) {
          expect(failure, isA<CacheFailure>());
          expect(failure.message, contains('Exception: Failed to delete'));
        }, (_) => fail('Should return Left'));
        verify(mockDataSource.deletePreference(tId));
        verifyNoMoreInteractions(mockDataSource);
      },
    );

    test('should pass id parameter correctly to datasource', () async {
      // Arrange
      const differentId = 42;
      when(
        mockDataSource.deletePreference(differentId),
      ).thenAnswer((_) async => Future.value());

      // Act
      await repository.deletePreference(differentId);

      // Assert
      verify(mockDataSource.deletePreference(differentId));
      verifyNoMoreInteractions(mockDataSource);
    });
  });
}
