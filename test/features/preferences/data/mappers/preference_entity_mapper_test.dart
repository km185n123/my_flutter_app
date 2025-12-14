import 'package:flutter_test/flutter_test.dart';
import 'package:my_flutter_app/features/preferences/data/mappers/preference_entity_mapper.dart';
import 'package:my_flutter_app/features/preferences/data/models/preference_model.dart';
import 'package:my_flutter_app/features/preferences/domain/entities/preference.dart';

import '../../../../helpers/test_data.dart';

void main() {
  group('PreferenceEntityMapper', () {
    test('should convert Preference entity to PreferenceModel correctly', () {
      // Act
      final result = tPreference.toModel();

      // Assert
      expect(result, tPreferenceModel);
      expect(result.id, tPreference.id);
      expect(result.originalName, tPreference.originalName);
      expect(result.customName, tPreference.customName);
      expect(result.species, tPreference.species);
      expect(result.image, tPreference.image);
    });

    test('should maintain data integrity during conversion', () {
      // Arrange
      const entity = tPreference;

      // Act
      final model = entity.toModel();

      // Assert - verify all fields are preserved
      expect(model.id, entity.id);
      expect(model.originalName, entity.originalName);
      expect(model.customName, entity.customName);
      expect(model.species, entity.species);
      expect(model.image, entity.image);
    });

    test('should handle different preference data correctly', () {
      // Arrange
      final differentEntity = Preference(
        id: 2,
        originalName: 'Morty Smith',
        customName: 'My Morty',
        species: 'Human',
        image: 'https://rickandmortyapi.com/api/character/avatar/2.jpeg',
      );

      // Act
      final result = differentEntity.toModel();

      // Assert
      expect(result.id, 2);
      expect(result.originalName, 'Morty Smith');
      expect(result.customName, 'My Morty');
      expect(result.species, 'Human');
      expect(
        result.image,
        'https://rickandmortyapi.com/api/character/avatar/2.jpeg',
      );
    });

    test('should be inverse of PreferenceModelMapper', () {
      // Arrange
      const entity = tPreference;

      // Act - convert entity to model and back to entity
      final model = entity.toModel();
      final backToEntity = model.toEntity();

      // Assert - should get the same entity back
      expect(backToEntity, entity);
    });
  });
}
