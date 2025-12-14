// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Rick and Morty Favorites';

  @override
  String get charactersTitle => 'Characters';

  @override
  String get favoritesTitle => 'Favorites';

  @override
  String get searchPlaceholder => 'Search characters...';

  @override
  String get retry => 'Retry';

  @override
  String get noCharactersFound => 'No characters found';

  @override
  String get errorLoading => 'Error loading characters';

  @override
  String get save => 'Save';

  @override
  String get delete => 'Delete';

  @override
  String get preferenceNotFound => 'Preference not found';

  @override
  String get customName => 'Custom Name';

  @override
  String get originalName => 'Original Name';

  @override
  String get species => 'Species';

  @override
  String get status => 'Status';

  @override
  String get enterCustomName => 'Enter a custom name';

  @override
  String get preferenceSaved => 'Preference saved';

  @override
  String get preferenceDeleted => 'Preference deleted';

  @override
  String get emptyFavorites => 'No favorites yet';

  @override
  String get addFavorite => 'Add Favorite';

  @override
  String get details => 'Details';

  @override
  String get unknown => 'Unknown';
}
