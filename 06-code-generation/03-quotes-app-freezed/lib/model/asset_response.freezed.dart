// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'asset_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AssetResponse _$AssetResponseFromJson(Map<String, dynamic> json) {
  return _AssetResponse.fromJson(json);
}

/// @nodoc
mixin _$AssetResponse {
  @JsonKey(name: "list_quotes")
  List<Quote> get list => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AssetResponseCopyWith<AssetResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssetResponseCopyWith<$Res> {
  factory $AssetResponseCopyWith(
          AssetResponse value, $Res Function(AssetResponse) then) =
      _$AssetResponseCopyWithImpl<$Res, AssetResponse>;
  @useResult
  $Res call({@JsonKey(name: "list_quotes") List<Quote> list});
}

/// @nodoc
class _$AssetResponseCopyWithImpl<$Res, $Val extends AssetResponse>
    implements $AssetResponseCopyWith<$Res> {
  _$AssetResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
  }) {
    return _then(_value.copyWith(
      list: null == list
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<Quote>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AssetResponseCopyWith<$Res>
    implements $AssetResponseCopyWith<$Res> {
  factory _$$_AssetResponseCopyWith(
          _$_AssetResponse value, $Res Function(_$_AssetResponse) then) =
      __$$_AssetResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "list_quotes") List<Quote> list});
}

/// @nodoc
class __$$_AssetResponseCopyWithImpl<$Res>
    extends _$AssetResponseCopyWithImpl<$Res, _$_AssetResponse>
    implements _$$_AssetResponseCopyWith<$Res> {
  __$$_AssetResponseCopyWithImpl(
      _$_AssetResponse _value, $Res Function(_$_AssetResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
  }) {
    return _then(_$_AssetResponse(
      list: null == list
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<Quote>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AssetResponse implements _AssetResponse {
  const _$_AssetResponse(
      {@JsonKey(name: "list_quotes") required final List<Quote> list})
      : _list = list;

  factory _$_AssetResponse.fromJson(Map<String, dynamic> json) =>
      _$$_AssetResponseFromJson(json);

  final List<Quote> _list;
  @override
  @JsonKey(name: "list_quotes")
  List<Quote> get list {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  @override
  String toString() {
    return 'AssetResponse(list: $list)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AssetResponse &&
            const DeepCollectionEquality().equals(other._list, _list));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_list));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AssetResponseCopyWith<_$_AssetResponse> get copyWith =>
      __$$_AssetResponseCopyWithImpl<_$_AssetResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AssetResponseToJson(
      this,
    );
  }
}

abstract class _AssetResponse implements AssetResponse {
  const factory _AssetResponse(
          {@JsonKey(name: "list_quotes") required final List<Quote> list}) =
      _$_AssetResponse;

  factory _AssetResponse.fromJson(Map<String, dynamic> json) =
      _$_AssetResponse.fromJson;

  @override
  @JsonKey(name: "list_quotes")
  List<Quote> get list;
  @override
  @JsonKey(ignore: true)
  _$$_AssetResponseCopyWith<_$_AssetResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
