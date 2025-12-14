import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:my_flutter_app/core/error/failure.dart';
import 'package:my_flutter_app/features/preferences/domain/entities/preference.dart';
import 'package:my_flutter_app/features/preferences/domain/repositories/i_preference_repository.dart';
import 'package:my_flutter_app/features/preferences/domain/usecases/preference_usecases.dart';

import '../../../../helpers/test_data.dart';
import 'get_preferences_usecase_test.mocks.dart';

@GenerateMocks([IPreferenceRepository])
void main() {
  late GetPreferencesUseCase useCase;
  late MockIPreferenceRepository mockRepository;

  setUp(() {
    mockRepository = MockIPreferenceRepository();
    useCase = GetPreferencesUseCase(mockRepository);

    // Provide dummy values for Either types
    provideDummy<Either<Failure, List<Preference>>>(const Right([]));
  });

  group('GetPreferencesUseCase', () {
    test(
      'should return list of preferences when repository call is successful',
      () async {
        // Arrange
        when(
          mockRepository.getPreferences(),
        ).thenAnswer((_) async => const Right(tPreferenceList));

        // Act
        final result = await useCase();

        // Assert
        expect(result, const Right(tPreferenceList));
        verify(mockRepository.getPreferences());
        verifyNoMoreInteractions(mockRepository);
      },
    );

    test('should return CacheFailure when repository call fails', () async {
      // Arrange
      const tFailure = CacheFailure(tErrorMessage);
      when(
        mockRepository.getPreferences(),
      ).thenAnswer((_) async => const Left(tFailure));

      // Act
      final result = await useCase();

      // Assert
      expect(result, const Left(tFailure));
      verify(mockRepository.getPreferences());
      verifyNoMoreInteractions(mockRepository);
    });

    test(
      'should return empty list when repository returns empty list',
      () async {
        // Arrange
        when(
          mockRepository.getPreferences(),
        ).thenAnswer((_) async => const Right([]));

        // Act
        final result = await useCase();

        // Assert
        expect(result, const Right([]));
        verify(mockRepository.getPreferences());
        verifyNoMoreInteractions(mockRepository);
      },
    );
  });
}
