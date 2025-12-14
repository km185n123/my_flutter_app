import 'package:flutter/material.dart';

import '../../../../../../core/theme/app_colors.dart';
import '../../../../domain/entities/preference.dart';

class PreferenceHeader extends StatelessWidget {
  final Preference preference;

  const PreferenceHeader({super.key, required this.preference});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 340,
      width: double.infinity,
      padding: const EdgeInsets.only(top: 48),
      decoration: const BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(32)),
      ),
      child: Column(
        children: [
          Text(
            preference.customName,
            style: Theme.of(
              context,
            ).textTheme.headlineLarge?.copyWith(color: Colors.white),
          ),
          const SizedBox(height: 4),
          Text(
            preference.originalName,
            style: const TextStyle(color: Colors.white70),
          ),
          const SizedBox(height: 16),
          Image.network(preference.image, height: 160, fit: BoxFit.contain),
        ],
      ),
    );
  }
}
