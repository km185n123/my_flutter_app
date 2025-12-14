import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../../domain/entities/preference.dart';

part 'preference_model.freezed.dart';
part 'preference_model.g.dart';

@freezed
class PreferenceModel with _$PreferenceModel {
  @HiveType(typeId: 0)
  const factory PreferenceModel({
    @HiveField(0) required int id,
    @HiveField(1) required String customName,
    @HiveField(2) required String originalName,
    @HiveField(3) required String species,
    @HiveField(4) required String image,
  }) = _PreferenceModel;

  factory PreferenceModel.fromJson(Map<String, dynamic> json) =>
      _$PreferenceModelFromJson(json);
}

extension PreferenceModelX on PreferenceModel {
  Preference toEntity() {
    return Preference(
      id: id,
      originalName: originalName,
      customName: customName,
      species: species,
      image: image,
    );
  }
}
