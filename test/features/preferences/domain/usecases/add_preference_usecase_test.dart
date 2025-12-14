import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:my_flutter_app/core/error/failure.dart';
import 'package:my_flutter_app/features/preferences/domain/entities/preference.dart';
import 'package:my_flutter_app/features/preferences/domain/repositories/i_preference_repository.dart';
import 'package:my_flutter_app/features/preferences/domain/usecases/preference_usecases.dart';

import '../../../../helpers/test_data.dart';
import 'add_preference_usecase_test.mocks.dart';

@GenerateMocks([IPreferenceRepository])
void main() {
  late AddPreferenceUseCase useCase;
  late MockIPreferenceRepository mockRepository;

  setUp(() {
    mockRepository = MockIPreferenceRepository();
    useCase = AddPreferenceUseCase(mockRepository);

    // Provide dummy values for Either types
    provideDummy<Either<Failure, void>>(const Right(null));
  });

  group('AddPreferenceUseCase', () {
    test(
      'should add preference successfully when repository call succeeds',
      () async {
        // Arrange
        when(
          mockRepository.addPreference(tPreference),
        ).thenAnswer((_) async => const Right(null));

        // Act
        final result = await useCase(tPreference);

        // Assert
        expect(result, const Right(null));
        verify(mockRepository.addPreference(tPreference));
        verifyNoMoreInteractions(mockRepository);
      },
    );

    test('should return CacheFailure when repository call fails', () async {
      // Arrange
      const tFailure = CacheFailure(tErrorMessage);
      when(
        mockRepository.addPreference(tPreference),
      ).thenAnswer((_) async => const Left(tFailure));

      // Act
      final result = await useCase(tPreference);

      // Assert
      expect(result, const Left(tFailure));
      verify(mockRepository.addPreference(tPreference));
      verifyNoMoreInteractions(mockRepository);
    });

    test(
      'should pass the preference parameter correctly to repository',
      () async {
        // Arrange
        const differentPreference = Preference(
          id: 2,
          originalName: 'Morty Smith',
          customName: 'My Morty',
          species: 'Human',
          image: 'https://rickandmortyapi.com/api/character/avatar/2.jpeg',
        );
        when(
          mockRepository.addPreference(differentPreference),
        ).thenAnswer((_) async => const Right(null));

        // Act
        await useCase(differentPreference);

        // Assert
        verify(mockRepository.addPreference(differentPreference));
        verifyNoMoreInteractions(mockRepository);
      },
    );
  });
}
