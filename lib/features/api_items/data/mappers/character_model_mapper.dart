import '../../domain/entities/character.dart';
import '../models/character_model.dart';

extension CharacterModelX on CharacterModel {
  Character toEntity() {
    return Character(
      id: id,
      name: name,
      status: status,
      species: species,
      image: image,
    );
  }
}
