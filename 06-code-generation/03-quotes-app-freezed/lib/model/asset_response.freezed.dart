// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'asset_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AssetResponse {

@JsonKey(name: "list_quotes") List<Quote> get list;
/// Create a copy of AssetResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AssetResponseCopyWith<AssetResponse> get copyWith => _$AssetResponseCopyWithImpl<AssetResponse>(this as AssetResponse, _$identity);

  /// Serializes this AssetResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AssetResponse&&const DeepCollectionEquality().equals(other.list, list));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(list));

@override
String toString() {
  return 'AssetResponse(list: $list)';
}


}

/// @nodoc
abstract mixin class $AssetResponseCopyWith<$Res>  {
  factory $AssetResponseCopyWith(AssetResponse value, $Res Function(AssetResponse) _then) = _$AssetResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "list_quotes") List<Quote> list
});




}
/// @nodoc
class _$AssetResponseCopyWithImpl<$Res>
    implements $AssetResponseCopyWith<$Res> {
  _$AssetResponseCopyWithImpl(this._self, this._then);

  final AssetResponse _self;
  final $Res Function(AssetResponse) _then;

/// Create a copy of AssetResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? list = null,}) {
  return _then(_self.copyWith(
list: null == list ? _self.list : list // ignore: cast_nullable_to_non_nullable
as List<Quote>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _AssetResponse implements AssetResponse {
  const _AssetResponse({@JsonKey(name: "list_quotes") required final  List<Quote> list}): _list = list;
  factory _AssetResponse.fromJson(Map<String, dynamic> json) => _$AssetResponseFromJson(json);

 final  List<Quote> _list;
@override@JsonKey(name: "list_quotes") List<Quote> get list {
  if (_list is EqualUnmodifiableListView) return _list;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_list);
}


/// Create a copy of AssetResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AssetResponseCopyWith<_AssetResponse> get copyWith => __$AssetResponseCopyWithImpl<_AssetResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AssetResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AssetResponse&&const DeepCollectionEquality().equals(other._list, _list));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_list));

@override
String toString() {
  return 'AssetResponse(list: $list)';
}


}

/// @nodoc
abstract mixin class _$AssetResponseCopyWith<$Res> implements $AssetResponseCopyWith<$Res> {
  factory _$AssetResponseCopyWith(_AssetResponse value, $Res Function(_AssetResponse) _then) = __$AssetResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "list_quotes") List<Quote> list
});




}
/// @nodoc
class __$AssetResponseCopyWithImpl<$Res>
    implements _$AssetResponseCopyWith<$Res> {
  __$AssetResponseCopyWithImpl(this._self, this._then);

  final _AssetResponse _self;
  final $Res Function(_AssetResponse) _then;

/// Create a copy of AssetResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? list = null,}) {
  return _then(_AssetResponse(
list: null == list ? _self._list : list // ignore: cast_nullable_to_non_nullable
as List<Quote>,
  ));
}


}

// dart format on
