import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_app/l10n/app_localizations.dart';
import 'core/config/app_config.dart';
import 'core/di/injection.dart';
import 'core/local/hive_config.dart';
import 'core/router/router.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/cubit/theme_cubit.dart';
import 'features/api_items/presentation/cubit/api_cubit.dart';
import 'features/preferences/presentation/cubit/preference_cubit.dart';

Future<void> bootstrap(AppConfig config) async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive
  await HiveConfig.init();

  // Configure Dependencies
  configureDependencies(config);

  // Initialize Theme
  final themeCubit = getIt<ThemeCubit>();
  await themeCubit.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<ThemeCubit>()),
        BlocProvider(create: (context) => getIt<ApiCubit>()),
        BlocProvider(create: (context) => getIt<PreferenceCubit>()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, themeState) {
          // Update system brightness when it changes
          final brightness = MediaQuery.platformBrightnessOf(context);
          context.read<ThemeCubit>().updateSystemBrightness(brightness);

          return MaterialApp.router(
            title: 'Rick and Morty Favorites',
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,

            // Theme Configuration
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: context.read<ThemeCubit>().effectiveThemeMode,

            routerConfig: router,
          );
        },
      ),
    );
  }
}
