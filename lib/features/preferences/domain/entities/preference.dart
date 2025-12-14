import 'package:equatable/equatable.dart';

class Preference extends Equatable {
  final int id;
  final String originalName;
  final String customName;
  final String species;
  final String image;

  const Preference({
    required this.id,
    required this.originalName,
    required this.customName,
    required this.species,
    required this.image,
  });

  @override
  List<Object> get props => [id, originalName, customName, species, image];
}
