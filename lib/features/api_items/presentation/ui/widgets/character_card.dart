import 'package:flutter/material.dart';
import '../../../../../core/ui/entity_card.dart';
import '../../../domain/entities/character.dart';

class CharacterCard extends StatelessWidget {
  final Character character;
  final ValueChanged<Character> onTap;

  const CharacterCard({
    super.key,
    required this.character,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return EntityCard(
      imageUrl: character.image,
      title: character.name,
      subtitle: character.species,
      onTap: () => onTap(character),
    );
  }
}
