import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_flutter_app/l10n/app_localizations.dart';

import '../../../../api_items/domain/entities/character.dart';
import '../../../domain/entities/preference.dart';
import '../../cubit/preference_cubit.dart';
import '../widgets/form/preference_form_card.dart';
import '../widgets/form/preference_form_header.dart';

class PreferenceFormScreen extends StatefulWidget {
  final Character character;

  const PreferenceFormScreen({super.key, required this.character});

  @override
  State<PreferenceFormScreen> createState() => _PreferenceFormScreenState();
}

class _PreferenceFormScreenState extends State<PreferenceFormScreen> {
  final _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _onSave() {
    if (_nameController.text.isEmpty) return;

    final preference = Preference(
      id: widget.character.id,
      originalName: widget.character.name,
      customName: _nameController.text,
      species: widget.character.species,
      image: widget.character.image,
    );

    context.read<PreferenceCubit>().addPreference(preference);
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      body: SizedBox.expand(
        child: Stack(
          children: [
            PreferenceFormHeader(character: widget.character),
            PreferenceFormCard(
              controller: _nameController,
              originalName: widget.character.name,
              onCancel: context.pop,
              onSave: _onSave,
              l10n: l10n,
            ),
          ],
        ),
      ),
    );
  }
}
