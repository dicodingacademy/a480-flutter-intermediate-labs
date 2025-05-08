// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'loading_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LoadingState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoadingState()';
}


}

/// @nodoc
class $LoadingStateCopyWith<$Res>  {
$LoadingStateCopyWith(LoadingState _, $Res Function(LoadingState) __);
}


/// @nodoc


class LoadingStateInitial implements LoadingState {
  const LoadingStateInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingStateInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoadingState.initial()';
}


}




/// @nodoc


class LoadingStateLoading implements LoadingState {
  const LoadingStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoadingState.loading()';
}


}




/// @nodoc


class LoadingStateLoaded implements LoadingState {
  const LoadingStateLoaded(final  List<Quote> data): _data = data;
  

 final  List<Quote> _data;
 List<Quote> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of LoadingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadingStateLoadedCopyWith<LoadingStateLoaded> get copyWith => _$LoadingStateLoadedCopyWithImpl<LoadingStateLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingStateLoaded&&const DeepCollectionEquality().equals(other._data, _data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'LoadingState.loaded(data: $data)';
}


}

/// @nodoc
abstract mixin class $LoadingStateLoadedCopyWith<$Res> implements $LoadingStateCopyWith<$Res> {
  factory $LoadingStateLoadedCopyWith(LoadingStateLoaded value, $Res Function(LoadingStateLoaded) _then) = _$LoadingStateLoadedCopyWithImpl;
@useResult
$Res call({
 List<Quote> data
});




}
/// @nodoc
class _$LoadingStateLoadedCopyWithImpl<$Res>
    implements $LoadingStateLoadedCopyWith<$Res> {
  _$LoadingStateLoadedCopyWithImpl(this._self, this._then);

  final LoadingStateLoaded _self;
  final $Res Function(LoadingStateLoaded) _then;

/// Create a copy of LoadingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(LoadingStateLoaded(
null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<Quote>,
  ));
}


}

/// @nodoc


class LoadingStateError implements LoadingState {
  const LoadingStateError(this.message);
  

 final  String message;

/// Create a copy of LoadingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadingStateErrorCopyWith<LoadingStateError> get copyWith => _$LoadingStateErrorCopyWithImpl<LoadingStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingStateError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'LoadingState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $LoadingStateErrorCopyWith<$Res> implements $LoadingStateCopyWith<$Res> {
  factory $LoadingStateErrorCopyWith(LoadingStateError value, $Res Function(LoadingStateError) _then) = _$LoadingStateErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$LoadingStateErrorCopyWithImpl<$Res>
    implements $LoadingStateErrorCopyWith<$Res> {
  _$LoadingStateErrorCopyWithImpl(this._self, this._then);

  final LoadingStateError _self;
  final $Res Function(LoadingStateError) _then;

/// Create a copy of LoadingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(LoadingStateError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
