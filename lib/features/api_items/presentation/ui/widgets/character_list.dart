import 'package:flutter/material.dart';
import '../../../domain/entities/character.dart';
import 'character_card.dart';

class CharacterList extends StatelessWidget {
  final List<Character> characters;
  final ValueChanged<Character> onTap;

  const CharacterList({
    super.key,
    required this.characters,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(12),
      itemCount: characters.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        return CharacterCard(character: characters[index], onTap: onTap);
      },
    );
  }
}
