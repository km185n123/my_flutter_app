import '../../domain/entities/preference.dart';
import '../models/preference_model.dart';

extension PreferenceX on Preference {
  PreferenceModel toModel() {
    return PreferenceModel(
      id: id,
      originalName: originalName,
      customName: customName,
      species: species,
      image: image,
    );
  }
}
