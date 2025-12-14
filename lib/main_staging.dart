import 'core/config/app_config.dart';
import 'main.dart';

void main() {
  bootstrap(
    AppConfig(
      flavor: Flavor.staging,
      baseUrl: 'https://rickandmortyapi.com/api',
      appName: 'R&M Staging',
    ),
  );
}
