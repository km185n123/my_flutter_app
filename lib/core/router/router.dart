import 'package:go_router/go_router.dart';
import '../../features/api_items/domain/entities/character.dart';
import '../../features/api_items/presentation/ui/view/api_list_screen.dart';
import '../../features/preferences/domain/entities/preference.dart';
import '../../features/preferences/presentation/ui/view/preference_detail_screen.dart';
import '../../features/preferences/presentation/ui/view/preference_form_screen.dart';
import '../../features/preferences/presentation/ui/view/preference_list_screen.dart';
import '../theme/ui/theme_settings_screen.dart';

final router = GoRouter(
  initialLocation: '/api-list',
  routes: [
    GoRoute(
      path: '/api-list',
      builder: (context, state) => const ApiListScreen(),
    ),
    GoRoute(
      path: '/preferences/detail',
      builder: (context, state) {
        final preference = state.extra as Preference;
        return PreferenceDetailScreen(preference: preference);
      },
    ),
    GoRoute(
      path: '/preferences/add',
      builder: (context, state) {
        final character = state.extra as Character;
        return PreferenceFormScreen(character: character);
      },
    ),
    GoRoute(
      path: '/prefs',
      builder: (context, state) => const PreferenceListScreen(),
    ),
    GoRoute(
      path: '/theme-settings',
      builder: (context, state) => const ThemeSettingsScreen(),
    ),
  ],
);
