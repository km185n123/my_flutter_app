import 'package:my_flutter_app/features/api_items/domain/entities/character.dart';
import 'package:my_flutter_app/features/api_items/data/models/character_model.dart';
import 'package:my_flutter_app/features/preferences/domain/entities/preference.dart';
import 'package:my_flutter_app/features/preferences/data/models/preference_model.dart';

/// Test data for Character entity
const tCharacter = Character(
  id: 1,
  name: 'Rick Sanchez',
  status: 'Alive',
  species: 'Human',
  image: 'https://rickandmortyapi.com/api/character/avatar/1.jpeg',
);

/// Test data for CharacterModel
const tCharacterModel = CharacterModel(
  id: 1,
  name: 'Rick Sanchez',
  status: 'Alive',
  species: 'Human',
  image: 'https://rickandmortyapi.com/api/character/avatar/1.jpeg',
);

/// Test data for list of characters
const tCharacterList = [tCharacter];

/// Test data for list of character models
const tCharacterModelList = [tCharacterModel];

/// Test data for Preference entity
const tPreference = Preference(
  id: 1,
  originalName: 'Rick Sanchez',
  customName: 'My Favorite Rick',
  species: 'Human',
  image: 'https://rickandmortyapi.com/api/character/avatar/1.jpeg',
);

/// Test data for PreferenceModel
final tPreferenceModel = PreferenceModel(
  id: 1,
  originalName: 'Rick Sanchez',
  customName: 'My Favorite Rick',
  species: 'Human',
  image: 'https://rickandmortyapi.com/api/character/avatar/1.jpeg',
);

/// Test data for list of preferences
const tPreferenceList = [tPreference];

/// Test data for list of preference models
final tPreferenceModelList = [tPreferenceModel];

/// Test error message
const tErrorMessage = 'Test error message';
