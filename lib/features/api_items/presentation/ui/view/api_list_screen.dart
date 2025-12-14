import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_flutter_app/l10n/app_localizations.dart';

import '../../cubit/api_cubit.dart';
import '../../cubit/api_state.dart';
import '../widgets/character_list.dart';
import '../widgets/character_search_bar.dart';

class ApiListScreen extends StatefulWidget {
  const ApiListScreen({super.key});

  @override
  State<ApiListScreen> createState() => _ApiListScreenState();
}

class _ApiListScreenState extends State<ApiListScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<ApiCubit>().fetchCharacters();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearch(String query) {
    context.read<ApiCubit>().searchCharacters(query);
  }

  Future<void> _onRefresh() async {
    context.read<ApiCubit>().fetchCharacters();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.charactersTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_outline),
            onPressed: () => context.push('/prefs'),
          ),
        ],
      ),
      body: Column(
        children: [
          CharacterSearchBar(
            controller: _searchController,
            hintText: l10n.searchPlaceholder,
            onSearch: _onSearch,
          ),
          const SizedBox(height: 8),
          Expanded(
            child: RefreshIndicator(
              onRefresh: _onRefresh,
              child: BlocBuilder<ApiCubit, ApiState>(
                builder: (context, state) {
                  if (state is ApiLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state is ApiSuccess) {
                    if (state.characters.isEmpty) {
                      return ListView(
                        children: [
                          SizedBox(
                            height: 300,
                            child: Center(child: Text(l10n.noCharactersFound)),
                          ),
                        ],
                      );
                    }

                    return CharacterList(
                      characters: state.characters,
                      onTap: (character) {
                        context.push('/preferences/add', extra: character);
                      },
                    );
                  }

                  if (state is ApiError) {
                    return ListView(
                      children: [
                        SizedBox(
                          height: 300,
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(state.message),
                                const SizedBox(height: 16),
                                ElevatedButton(
                                  onPressed: () {
                                    context.read<ApiCubit>().fetchCharacters();
                                  },
                                  child: const Text('Reintentar'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  }

                  return ListView(
                    children: const [
                      SizedBox(
                        height: 300,
                        child: Center(
                          child: Text('Start searching or wait for load'),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
