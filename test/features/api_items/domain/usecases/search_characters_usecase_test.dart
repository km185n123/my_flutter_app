import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:my_flutter_app/core/error/failure.dart';
import 'package:my_flutter_app/features/api_items/domain/repositories/i_api_repository.dart';
import 'package:my_flutter_app/features/api_items/domain/usecases/search_characters_usecase.dart';

import '../../../../helpers/test_data.dart';
import 'search_characters_usecase_test.mocks.dart';

@GenerateMocks([IApiRepository])
void main() {
  late SearchCharactersUseCase useCase;
  late MockIApiRepository mockRepository;

  setUp(() {
    mockRepository = MockIApiRepository();
    useCase = SearchCharactersUseCase(mockRepository);
  });

  group('SearchCharactersUseCase', () {
    const tQuery = 'Rick';

    test(
      'should return list of characters when search is successful',
      () async {
        // Arrange
        when(
          mockRepository.searchCharacters(tQuery),
        ).thenAnswer((_) async => const Right(tCharacterList));

        // Act
        final result = await useCase(tQuery);

        // Assert
        expect(result, const Right(tCharacterList));
        verify(mockRepository.searchCharacters(tQuery));
        verifyNoMoreInteractions(mockRepository);
      },
    );

    test('should return ServerFailure when search fails', () async {
      // Arrange
      const tFailure = ServerFailure(tErrorMessage);
      when(
        mockRepository.searchCharacters(tQuery),
      ).thenAnswer((_) async => const Left(tFailure));

      // Act
      final result = await useCase(tQuery);

      // Assert
      expect(result, const Left(tFailure));
      verify(mockRepository.searchCharacters(tQuery));
      verifyNoMoreInteractions(mockRepository);
    });

    test(
      'should return empty list when no characters match the query',
      () async {
        // Arrange
        when(
          mockRepository.searchCharacters(tQuery),
        ).thenAnswer((_) async => const Right([]));

        // Act
        final result = await useCase(tQuery);

        // Assert
        expect(result, const Right([]));
        verify(mockRepository.searchCharacters(tQuery));
        verifyNoMoreInteractions(mockRepository);
      },
    );

    test('should pass the query parameter correctly to repository', () async {
      // Arrange
      const tDifferentQuery = 'Morty';
      when(
        mockRepository.searchCharacters(tDifferentQuery),
      ).thenAnswer((_) async => const Right(tCharacterList));

      // Act
      await useCase(tDifferentQuery);

      // Assert
      verify(mockRepository.searchCharacters(tDifferentQuery));
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
