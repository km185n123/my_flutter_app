// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preference_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PreferenceModelImplAdapter extends TypeAdapter<_$PreferenceModelImpl> {
  @override
  final int typeId = 0;

  @override
  _$PreferenceModelImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$PreferenceModelImpl(
      id: fields[0] as int,
      customName: fields[1] as String,
      originalName: fields[2] as String,
      species: fields[3] as String,
      image: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _$PreferenceModelImpl obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.customName)
      ..writeByte(2)
      ..write(obj.originalName)
      ..writeByte(3)
      ..write(obj.species)
      ..writeByte(4)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PreferenceModelImplAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PreferenceModelImpl _$$PreferenceModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PreferenceModelImpl(
      id: (json['id'] as num).toInt(),
      customName: json['customName'] as String,
      originalName: json['originalName'] as String,
      species: json['species'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$$PreferenceModelImplToJson(
        _$PreferenceModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'customName': instance.customName,
      'originalName': instance.originalName,
      'species': instance.species,
      'image': instance.image,
    };
