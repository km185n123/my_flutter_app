import 'core/config/app_config.dart';
import 'main.dart';

void main() {
  bootstrap(
    AppConfig(
      flavor: Flavor.prod,
      baseUrl: 'https://rickandmortyapi.com/api',
      appName: 'Rick and Morty Favorites',
    ),
  );
}
