import 'package:flutter_test/flutter_test.dart';
import 'package:my_flutter_app/features/api_items/data/mappers/character_model_mapper.dart';
import 'package:my_flutter_app/features/api_items/data/models/character_model.dart';

import '../../../../helpers/test_data.dart';

void main() {
  group('CharacterModelMapper', () {
    test('should convert CharacterModel to Character entity correctly', () {
      // Act
      final result = tCharacterModel.toEntity();

      // Assert
      expect(result, tCharacter);
      expect(result.id, tCharacterModel.id);
      expect(result.name, tCharacterModel.name);
      expect(result.status, tCharacterModel.status);
      expect(result.species, tCharacterModel.species);
      expect(result.image, tCharacterModel.image);
    });

    test('should maintain data integrity during conversion', () {
      // Arrange
      const model = tCharacterModel;

      // Act
      final entity = model.toEntity();

      // Assert - verify all fields are preserved
      expect(entity.id, model.id);
      expect(entity.name, model.name);
      expect(entity.status, model.status);
      expect(entity.species, model.species);
      expect(entity.image, model.image);
    });

    test('should handle different character data correctly', () {
      // Arrange
      const differentModel = CharacterModel(
        id: 2,
        name: 'Morty Smith',
        status: 'Alive',
        species: 'Human',
        image: 'https://rickandmortyapi.com/api/character/avatar/2.jpeg',
      );

      // Act
      final result = differentModel.toEntity();

      // Assert
      expect(result.id, 2);
      expect(result.name, 'Morty Smith');
      expect(result.status, 'Alive');
      expect(result.species, 'Human');
      expect(
        result.image,
        'https://rickandmortyapi.com/api/character/avatar/2.jpeg',
      );
    });
  });
}
