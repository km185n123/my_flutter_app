import 'package:flutter/material.dart';

import '../../../../../core/ui/entity_card.dart';
import '../../../domain/entities/preference.dart';

class PreferenceCard extends StatelessWidget {
  final Preference preference;
  final ValueChanged<Preference> onTap;

  const PreferenceCard({
    super.key,
    required this.preference,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return EntityCard(
      imageUrl: preference.image,
      title: preference.customName, // 🔑 CLAVE
      subtitle: preference.originalName,
      onTap: () => onTap(preference),
    );
  }
}
