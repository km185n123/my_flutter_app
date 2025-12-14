import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import '../config/app_config.dart';
import '../theme/cubit/theme_cubit.dart';
import 'injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
void configureDependencies(AppConfig config) {
  getIt.registerSingleton<AppConfig>(config);
  getIt.registerSingleton<ThemeCubit>(ThemeCubit());
  getIt.init();
}
