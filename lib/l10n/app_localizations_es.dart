// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Favoritos de Rick y Morty';

  @override
  String get charactersTitle => 'Personajes';

  @override
  String get favoritesTitle => 'Favoritos';

  @override
  String get searchPlaceholder => 'Buscar personajes...';

  @override
  String get retry => 'Reintentar';

  @override
  String get noCharactersFound => 'No se encontraron personajes';

  @override
  String get errorLoading => 'Error cargando personajes';

  @override
  String get save => 'Guardar';

  @override
  String get delete => 'Eliminar';

  @override
  String get preferenceNotFound => 'Preferencia no encontrada';

  @override
  String get customName => 'Nombre Personalizado';

  @override
  String get originalName => 'Nombre Original';

  @override
  String get species => 'Especie';

  @override
  String get status => 'Estado';

  @override
  String get enterCustomName => 'Ingresa un nombre personalizado';

  @override
  String get preferenceSaved => 'Preferencia guardada';

  @override
  String get preferenceDeleted => 'Preferencia eliminada';

  @override
  String get emptyFavorites => 'Aún no hay favoritos';

  @override
  String get addFavorite => 'Agregar Favorito';

  @override
  String get details => 'Detalles';

  @override
  String get unknown => 'Desconocido';
}
