import 'package:flutter/material.dart';
import 'package:my_flutter_app/features/preferences/domain/entities/preference.dart';

class PreferenceInfoCard extends StatelessWidget {
  final Preference preference;

  const PreferenceInfoCard({super.key, required this.preference});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 280,
      left: 16,
      right: 16,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        elevation: 6,
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('About', style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 16),
              _InfoRow(label: 'Species', value: preference.species),
              _InfoRow(label: 'Original Name', value: preference.originalName),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Expanded(
            child: Text(label, style: Theme.of(context).textTheme.bodyMedium),
          ),
          Text(value, style: Theme.of(context).textTheme.bodyLarge),
        ],
      ),
    );
  }
}
