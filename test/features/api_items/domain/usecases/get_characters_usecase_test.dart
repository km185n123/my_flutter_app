import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:my_flutter_app/core/error/failure.dart';
import 'package:my_flutter_app/features/api_items/domain/repositories/i_api_repository.dart';
import 'package:my_flutter_app/features/api_items/domain/usecases/get_characters_usecase.dart';

import '../../../../helpers/test_data.dart';
import 'get_characters_usecase_test.mocks.dart';

@GenerateMocks([IApiRepository])
void main() {
  late GetCharactersUseCase useCase;
  late MockIApiRepository mockRepository;

  setUp(() {
    mockRepository = MockIApiRepository();
    useCase = GetCharactersUseCase(mockRepository);
  });

  group('GetCharactersUseCase', () {
    test(
      'should return list of characters when repository call is successful',
      () async {
        // Arrange
        when(
          mockRepository.getCharacters(),
        ).thenAnswer((_) async => const Right(tCharacterList));

        // Act
        final result = await useCase();

        // Assert
        expect(result, const Right(tCharacterList));
        verify(mockRepository.getCharacters());
        verifyNoMoreInteractions(mockRepository);
      },
    );

    test('should return ServerFailure when repository call fails', () async {
      // Arrange
      const tFailure = ServerFailure(tErrorMessage);
      when(
        mockRepository.getCharacters(),
      ).thenAnswer((_) async => const Left(tFailure));

      // Act
      final result = await useCase();

      // Assert
      expect(result, const Left(tFailure));
      verify(mockRepository.getCharacters());
      verifyNoMoreInteractions(mockRepository);
    });

    test(
      'should return empty list when repository returns empty list',
      () async {
        // Arrange
        when(
          mockRepository.getCharacters(),
        ).thenAnswer((_) async => const Right([]));

        // Act
        final result = await useCase();

        // Assert
        expect(result, const Right([]));
        verify(mockRepository.getCharacters());
        verifyNoMoreInteractions(mockRepository);
      },
    );
  });
}
