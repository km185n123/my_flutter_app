import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_flutter_app/l10n/app_localizations.dart';

import '../../cubit/preference_cubit.dart';
import '../../cubit/preference_state.dart';
import '../widgets/preference_card.dart';

class PreferenceListScreen extends StatefulWidget {
  const PreferenceListScreen({super.key});

  @override
  State<PreferenceListScreen> createState() => _PreferenceListScreenState();
}

class _PreferenceListScreenState extends State<PreferenceListScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PreferenceCubit>().loadPreferences();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.favoritesTitle),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/api-list'),
        ),
      ),
      body: BlocBuilder<PreferenceCubit, PreferenceState>(
        builder: (context, state) {
          if (state is PreferenceLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PreferenceLoaded) {
            if (state.preferences.isEmpty) {
              return Center(child: Text(l10n.emptyFavorites));
            }
            return ListView.separated(
              padding: const EdgeInsets.all(12),
              itemCount: state.preferences.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final preference = state.preferences[index];
                return PreferenceCard(
                  preference: preference,
                  onTap: (pref) {
                    context.push('/preferences/detail', extra: pref);
                  },
                );
              },
            );
          } else if (state is PreferenceError) {
            return Center(child: Text(state.message));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
