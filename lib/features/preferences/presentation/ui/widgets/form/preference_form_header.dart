import 'package:flutter/material.dart';

import '../../../../../../core/theme/app_colors.dart';
import '../../../../../api_items/domain/entities/character.dart';

class PreferenceFormHeader extends StatelessWidget {
  final Character character;

  const PreferenceFormHeader({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      width: double.infinity,
      padding: const EdgeInsets.only(top: 56),
      decoration: const BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(32)),
      ),
      child: Column(
        children: [
          Text(
            character.name,
            style: Theme.of(
              context,
            ).textTheme.headlineLarge?.copyWith(color: Colors.white),
          ),
          const SizedBox(height: 16),
          Image.network(character.image, height: 160, fit: BoxFit.contain),
        ],
      ),
    );
  }
}
