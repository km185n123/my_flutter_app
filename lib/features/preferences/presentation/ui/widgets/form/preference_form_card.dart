import 'package:flutter/material.dart';
import 'package:my_flutter_app/l10n/app_localizations.dart';

class PreferenceFormCard extends StatelessWidget {
  final TextEditingController controller;
  final String originalName;
  final VoidCallback onCancel;
  final VoidCallback onSave;
  final AppLocalizations l10n;

  const PreferenceFormCard({
    super.key,
    required this.controller,
    required this.originalName,
    required this.onCancel,
    required this.onSave,
    required this.l10n,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 260,
      left: 16,
      right: 16,
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.addFavorite,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 16),
                Text(
                  '${l10n.originalName}: $originalName',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 24),
                TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    labelText: l10n.customName,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: onCancel,
                        child: const Text('Cancel'),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: onSave,
                        child: Text(l10n.save),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
