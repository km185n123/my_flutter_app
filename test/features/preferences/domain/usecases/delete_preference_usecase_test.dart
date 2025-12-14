import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:my_flutter_app/core/error/failure.dart';
import 'package:my_flutter_app/features/preferences/domain/repositories/i_preference_repository.dart';
import 'package:my_flutter_app/features/preferences/domain/usecases/preference_usecases.dart';

import 'delete_preference_usecase_test.mocks.dart';

@GenerateMocks([IPreferenceRepository])
void main() {
  late DeletePreferenceUseCase useCase;
  late MockIPreferenceRepository mockRepository;

  setUp(() {
    mockRepository = MockIPreferenceRepository();
    useCase = DeletePreferenceUseCase(mockRepository);

    // Provide dummy values for Either types
    provideDummy<Either<Failure, void>>(const Right(null));
  });

  group('DeletePreferenceUseCase', () {
    const tId = 1;

    test(
      'should delete preference successfully when repository call succeeds',
      () async {
        // Arrange
        when(
          mockRepository.deletePreference(tId),
        ).thenAnswer((_) async => const Right(null));

        // Act
        final result = await useCase(tId);

        // Assert
        expect(result, const Right(null));
        verify(mockRepository.deletePreference(tId));
        verifyNoMoreInteractions(mockRepository);
      },
    );

    test('should return CacheFailure when repository call fails', () async {
      // Arrange
      const tFailure = CacheFailure('Failed to delete preference');
      when(
        mockRepository.deletePreference(tId),
      ).thenAnswer((_) async => const Left(tFailure));

      // Act
      final result = await useCase(tId);

      // Assert
      expect(result, const Left(tFailure));
      verify(mockRepository.deletePreference(tId));
      verifyNoMoreInteractions(mockRepository);
    });

    test('should pass the id parameter correctly to repository', () async {
      // Arrange
      const differentId = 42;
      when(
        mockRepository.deletePreference(differentId),
      ).thenAnswer((_) async => const Right(null));

      // Act
      await useCase(differentId);

      // Assert
      verify(mockRepository.deletePreference(differentId));
      verifyNoMoreInteractions(mockRepository);
    });

    test('should handle deletion of non-existent preference', () async {
      // Arrange
      const nonExistentId = 999;
      const tFailure = CacheFailure('Preference not found');
      when(
        mockRepository.deletePreference(nonExistentId),
      ).thenAnswer((_) async => const Left(tFailure));

      // Act
      final result = await useCase(nonExistentId);

      // Assert
      expect(result, const Left(tFailure));
      verify(mockRepository.deletePreference(nonExistentId));
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
