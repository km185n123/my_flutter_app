import 'package:flutter_test/flutter_test.dart';
import 'package:my_flutter_app/features/preferences/data/models/preference_model.dart';

import '../../../../helpers/test_data.dart';

void main() {
  group('PreferenceModelMapper', () {
    test('should convert PreferenceModel to Preference entity correctly', () {
      // Act
      final result = tPreferenceModel.toEntity();

      // Assert
      expect(result, tPreference);
      expect(result.id, tPreferenceModel.id);
      expect(result.originalName, tPreferenceModel.originalName);
      expect(result.customName, tPreferenceModel.customName);
      expect(result.species, tPreferenceModel.species);
      expect(result.image, tPreferenceModel.image);
    });

    test('should maintain data integrity during conversion', () {
      // Arrange
      final model = tPreferenceModel;

      // Act
      final entity = model.toEntity();

      // Assert - verify all fields are preserved
      expect(entity.id, model.id);
      expect(entity.originalName, model.originalName);
      expect(entity.customName, model.customName);
      expect(entity.species, model.species);
      expect(entity.image, model.image);
    });

    test('should handle different preference data correctly', () {
      // Arrange
      final differentModel = PreferenceModel(
        id: 2,
        originalName: 'Morty Smith',
        customName: 'My Morty',
        species: 'Human',
        image: 'https://rickandmortyapi.com/api/character/avatar/2.jpeg',
      );

      // Act
      final result = differentModel.toEntity();

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
  });
}
