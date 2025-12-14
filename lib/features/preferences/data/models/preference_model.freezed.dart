// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'preference_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PreferenceModel _$PreferenceModelFromJson(Map<String, dynamic> json) {
  return _PreferenceModel.fromJson(json);
}

/// @nodoc
mixin _$PreferenceModel {
  @HiveField(0)
  int get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get customName => throw _privateConstructorUsedError;
  @HiveField(2)
  String get originalName => throw _privateConstructorUsedError;
  @HiveField(3)
  String get species => throw _privateConstructorUsedError;
  @HiveField(4)
  String get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PreferenceModelCopyWith<PreferenceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PreferenceModelCopyWith<$Res> {
  factory $PreferenceModelCopyWith(
          PreferenceModel value, $Res Function(PreferenceModel) then) =
      _$PreferenceModelCopyWithImpl<$Res, PreferenceModel>;
  @useResult
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String customName,
      @HiveField(2) String originalName,
      @HiveField(3) String species,
      @HiveField(4) String image});
}

/// @nodoc
class _$PreferenceModelCopyWithImpl<$Res, $Val extends PreferenceModel>
    implements $PreferenceModelCopyWith<$Res> {
  _$PreferenceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? customName = null,
    Object? originalName = null,
    Object? species = null,
    Object? image = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      customName: null == customName
          ? _value.customName
          : customName // ignore: cast_nullable_to_non_nullable
              as String,
      originalName: null == originalName
          ? _value.originalName
          : originalName // ignore: cast_nullable_to_non_nullable
              as String,
      species: null == species
          ? _value.species
          : species // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PreferenceModelImplCopyWith<$Res>
    implements $PreferenceModelCopyWith<$Res> {
  factory _$$PreferenceModelImplCopyWith(_$PreferenceModelImpl value,
          $Res Function(_$PreferenceModelImpl) then) =
      __$$PreferenceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String customName,
      @HiveField(2) String originalName,
      @HiveField(3) String species,
      @HiveField(4) String image});
}

/// @nodoc
class __$$PreferenceModelImplCopyWithImpl<$Res>
    extends _$PreferenceModelCopyWithImpl<$Res, _$PreferenceModelImpl>
    implements _$$PreferenceModelImplCopyWith<$Res> {
  __$$PreferenceModelImplCopyWithImpl(
      _$PreferenceModelImpl _value, $Res Function(_$PreferenceModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? customName = null,
    Object? originalName = null,
    Object? species = null,
    Object? image = null,
  }) {
    return _then(_$PreferenceModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      customName: null == customName
          ? _value.customName
          : customName // ignore: cast_nullable_to_non_nullable
              as String,
      originalName: null == originalName
          ? _value.originalName
          : originalName // ignore: cast_nullable_to_non_nullable
              as String,
      species: null == species
          ? _value.species
          : species // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 0)
class _$PreferenceModelImpl implements _PreferenceModel {
  const _$PreferenceModelImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.customName,
      @HiveField(2) required this.originalName,
      @HiveField(3) required this.species,
      @HiveField(4) required this.image});

  factory _$PreferenceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PreferenceModelImplFromJson(json);

  @override
  @HiveField(0)
  final int id;
  @override
  @HiveField(1)
  final String customName;
  @override
  @HiveField(2)
  final String originalName;
  @override
  @HiveField(3)
  final String species;
  @override
  @HiveField(4)
  final String image;

  @override
  String toString() {
    return 'PreferenceModel(id: $id, customName: $customName, originalName: $originalName, species: $species, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PreferenceModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.customName, customName) ||
                other.customName == customName) &&
            (identical(other.originalName, originalName) ||
                other.originalName == originalName) &&
            (identical(other.species, species) || other.species == species) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, customName, originalName, species, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PreferenceModelImplCopyWith<_$PreferenceModelImpl> get copyWith =>
      __$$PreferenceModelImplCopyWithImpl<_$PreferenceModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PreferenceModelImplToJson(
      this,
    );
  }
}

abstract class _PreferenceModel implements PreferenceModel {
  const factory _PreferenceModel(
      {@HiveField(0) required final int id,
      @HiveField(1) required final String customName,
      @HiveField(2) required final String originalName,
      @HiveField(3) required final String species,
      @HiveField(4) required final String image}) = _$PreferenceModelImpl;

  factory _PreferenceModel.fromJson(Map<String, dynamic> json) =
      _$PreferenceModelImpl.fromJson;

  @override
  @HiveField(0)
  int get id;
  @override
  @HiveField(1)
  String get customName;
  @override
  @HiveField(2)
  String get originalName;
  @override
  @HiveField(3)
  String get species;
  @override
  @HiveField(4)
  String get image;
  @override
  @JsonKey(ignore: true)
  _$$PreferenceModelImplCopyWith<_$PreferenceModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
