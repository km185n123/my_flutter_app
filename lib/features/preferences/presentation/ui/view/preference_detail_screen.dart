import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_flutter_app/l10n/app_localizations.dart';

import '../../../domain/entities/preference.dart';
import '../../cubit/preference_cubit.dart';
import '../../cubit/preference_state.dart';
import '../widgets/detail/preference_actions.dart';
import '../widgets/detail/preference_header.dart';
import '../widgets/detail/preference_info_card.dart';

class PreferenceDetailScreen extends StatelessWidget {
  final Preference preference;

  const PreferenceDetailScreen({super.key, required this.preference});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      body: SizedBox.expand(
        child: BlocBuilder<PreferenceCubit, PreferenceState>(
          builder: (context, state) {
            if (state is PreferenceLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is PreferenceLoaded) {
              final exists = state.preferences.any(
                (e) => e.id == preference.id,
              );
              if (!exists) {
                return Center(child: Text(l10n.preferenceNotFound));
              }

              return Stack(
                children: [
                  PreferenceHeader(preference: preference),
                  PreferenceInfoCard(preference: preference),
                  PreferenceActions(
                    onBack: context.pop,
                    onDelete: () {
                      context.read<PreferenceCubit>().deletePreference(
                        preference.id,
                      );
                      context.pop();
                    },
                    deleteLabel: l10n.delete,
                  ),
                ],
              );
            }

            return Center(child: Text(l10n.unknown));
          },
        ),
      ),
    );
  }
}
