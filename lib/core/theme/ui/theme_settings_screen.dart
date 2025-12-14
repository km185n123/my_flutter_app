import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/theme_cubit.dart';
import '../app_theme_mode.dart';

/// Settings screen to test and demonstrate theme switching
class ThemeSettingsScreen extends StatelessWidget {
  const ThemeSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Configuración de Tema')),
      body: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              const Text(
                'Modo de Tema',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),

              // Light Mode Option
              RadioListTile<AppThemeMode>(
                title: const Text('Modo Claro'),
                subtitle: const Text('Siempre usar tema claro'),
                value: AppThemeMode.light,
                groupValue: state.themeMode,
                onChanged: (value) {
                  if (value != null) {
                    context.read<ThemeCubit>().setThemeMode(value);
                  }
                },
              ),

              // Dark Mode Option
              RadioListTile<AppThemeMode>(
                title: const Text('Modo Oscuro'),
                subtitle: const Text('Siempre usar tema oscuro'),
                value: AppThemeMode.dark,
                groupValue: state.themeMode,
                onChanged: (value) {
                  if (value != null) {
                    context.read<ThemeCubit>().setThemeMode(value);
                  }
                },
              ),

              // System Mode Option
              RadioListTile<AppThemeMode>(
                title: const Text('Automático (Sistema)'),
                subtitle: const Text('Seguir la configuración del sistema'),
                value: AppThemeMode.system,
                groupValue: state.themeMode,
                onChanged: (value) {
                  if (value != null) {
                    context.read<ThemeCubit>().setThemeMode(value);
                  }
                },
              ),

              const Divider(height: 32),

              // Theme Preview Card
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Vista Previa del Tema',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 16),

                      // Color Samples
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          _ColorSample(
                            label: 'Primary',
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          _ColorSample(
                            label: 'Secondary',
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          _ColorSample(
                            label: 'Surface',
                            color: Theme.of(context).colorScheme.surface,
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      // Button Samples
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text('Elevated'),
                          ),
                          OutlinedButton(
                            onPressed: () {},
                            child: const Text('Outlined'),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text('Text'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Info Card
              Card(
                color: Theme.of(context).colorScheme.primaryContainer,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.info_outline,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Información',
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'El tema se guarda automáticamente y se aplicará la próxima vez que abras la aplicación.',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _ColorSample extends StatelessWidget {
  final String label;
  final Color color;

  const _ColorSample({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Theme.of(context).dividerColor, width: 1),
          ),
        ),
        const SizedBox(height: 4),
        Text(label, style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }
}
