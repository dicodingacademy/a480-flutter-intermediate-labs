// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'loading_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoadingState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Quote> data) loaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Quote> data)? loaded,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Quote> data)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingStateInitial value) initial,
    required TResult Function(LoadingStateLoading value) loading,
    required TResult Function(LoadingStateLoaded value) loaded,
    required TResult Function(LoadingStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingStateInitial value)? initial,
    TResult? Function(LoadingStateLoading value)? loading,
    TResult? Function(LoadingStateLoaded value)? loaded,
    TResult? Function(LoadingStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingStateInitial value)? initial,
    TResult Function(LoadingStateLoading value)? loading,
    TResult Function(LoadingStateLoaded value)? loaded,
    TResult Function(LoadingStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoadingStateCopyWith<$Res> {
  factory $LoadingStateCopyWith(
          LoadingState value, $Res Function(LoadingState) then) =
      _$LoadingStateCopyWithImpl<$Res, LoadingState>;
}

/// @nodoc
class _$LoadingStateCopyWithImpl<$Res, $Val extends LoadingState>
    implements $LoadingStateCopyWith<$Res> {
  _$LoadingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadingStateInitialCopyWith<$Res> {
  factory _$$LoadingStateInitialCopyWith(_$LoadingStateInitial value,
          $Res Function(_$LoadingStateInitial) then) =
      __$$LoadingStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingStateInitialCopyWithImpl<$Res>
    extends _$LoadingStateCopyWithImpl<$Res, _$LoadingStateInitial>
    implements _$$LoadingStateInitialCopyWith<$Res> {
  __$$LoadingStateInitialCopyWithImpl(
      _$LoadingStateInitial _value, $Res Function(_$LoadingStateInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingStateInitial implements LoadingStateInitial {
  const _$LoadingStateInitial();

  @override
  String toString() {
    return 'LoadingState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Quote> data) loaded,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Quote> data)? loaded,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Quote> data)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingStateInitial value) initial,
    required TResult Function(LoadingStateLoading value) loading,
    required TResult Function(LoadingStateLoaded value) loaded,
    required TResult Function(LoadingStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingStateInitial value)? initial,
    TResult? Function(LoadingStateLoading value)? loading,
    TResult? Function(LoadingStateLoaded value)? loaded,
    TResult? Function(LoadingStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingStateInitial value)? initial,
    TResult Function(LoadingStateLoading value)? loading,
    TResult Function(LoadingStateLoaded value)? loaded,
    TResult Function(LoadingStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class LoadingStateInitial implements LoadingState {
  const factory LoadingStateInitial() = _$LoadingStateInitial;
}

/// @nodoc
abstract class _$$LoadingStateLoadingCopyWith<$Res> {
  factory _$$LoadingStateLoadingCopyWith(_$LoadingStateLoading value,
          $Res Function(_$LoadingStateLoading) then) =
      __$$LoadingStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingStateLoadingCopyWithImpl<$Res>
    extends _$LoadingStateCopyWithImpl<$Res, _$LoadingStateLoading>
    implements _$$LoadingStateLoadingCopyWith<$Res> {
  __$$LoadingStateLoadingCopyWithImpl(
      _$LoadingStateLoading _value, $Res Function(_$LoadingStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingStateLoading implements LoadingStateLoading {
  const _$LoadingStateLoading();

  @override
  String toString() {
    return 'LoadingState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Quote> data) loaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Quote> data)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Quote> data)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingStateInitial value) initial,
    required TResult Function(LoadingStateLoading value) loading,
    required TResult Function(LoadingStateLoaded value) loaded,
    required TResult Function(LoadingStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingStateInitial value)? initial,
    TResult? Function(LoadingStateLoading value)? loading,
    TResult? Function(LoadingStateLoaded value)? loaded,
    TResult? Function(LoadingStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingStateInitial value)? initial,
    TResult Function(LoadingStateLoading value)? loading,
    TResult Function(LoadingStateLoaded value)? loaded,
    TResult Function(LoadingStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingStateLoading implements LoadingState {
  const factory LoadingStateLoading() = _$LoadingStateLoading;
}

/// @nodoc
abstract class _$$LoadingStateLoadedCopyWith<$Res> {
  factory _$$LoadingStateLoadedCopyWith(_$LoadingStateLoaded value,
          $Res Function(_$LoadingStateLoaded) then) =
      __$$LoadingStateLoadedCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Quote> data});
}

/// @nodoc
class __$$LoadingStateLoadedCopyWithImpl<$Res>
    extends _$LoadingStateCopyWithImpl<$Res, _$LoadingStateLoaded>
    implements _$$LoadingStateLoadedCopyWith<$Res> {
  __$$LoadingStateLoadedCopyWithImpl(
      _$LoadingStateLoaded _value, $Res Function(_$LoadingStateLoaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$LoadingStateLoaded(
      null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Quote>,
    ));
  }
}

/// @nodoc

class _$LoadingStateLoaded implements LoadingStateLoaded {
  const _$LoadingStateLoaded(final List<Quote> data) : _data = data;

  final List<Quote> _data;
  @override
  List<Quote> get data {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'LoadingState.loaded(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingStateLoaded &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadingStateLoadedCopyWith<_$LoadingStateLoaded> get copyWith =>
      __$$LoadingStateLoadedCopyWithImpl<_$LoadingStateLoaded>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Quote> data) loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Quote> data)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Quote> data)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingStateInitial value) initial,
    required TResult Function(LoadingStateLoading value) loading,
    required TResult Function(LoadingStateLoaded value) loaded,
    required TResult Function(LoadingStateError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingStateInitial value)? initial,
    TResult? Function(LoadingStateLoading value)? loading,
    TResult? Function(LoadingStateLoaded value)? loaded,
    TResult? Function(LoadingStateError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingStateInitial value)? initial,
    TResult Function(LoadingStateLoading value)? loading,
    TResult Function(LoadingStateLoaded value)? loaded,
    TResult Function(LoadingStateError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class LoadingStateLoaded implements LoadingState {
  const factory LoadingStateLoaded(final List<Quote> data) =
      _$LoadingStateLoaded;

  List<Quote> get data;
  @JsonKey(ignore: true)
  _$$LoadingStateLoadedCopyWith<_$LoadingStateLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingStateErrorCopyWith<$Res> {
  factory _$$LoadingStateErrorCopyWith(
          _$LoadingStateError value, $Res Function(_$LoadingStateError) then) =
      __$$LoadingStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$LoadingStateErrorCopyWithImpl<$Res>
    extends _$LoadingStateCopyWithImpl<$Res, _$LoadingStateError>
    implements _$$LoadingStateErrorCopyWith<$Res> {
  __$$LoadingStateErrorCopyWithImpl(
      _$LoadingStateError _value, $Res Function(_$LoadingStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$LoadingStateError(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoadingStateError implements LoadingStateError {
  const _$LoadingStateError(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'LoadingState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingStateError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadingStateErrorCopyWith<_$LoadingStateError> get copyWith =>
      __$$LoadingStateErrorCopyWithImpl<_$LoadingStateError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Quote> data) loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Quote> data)? loaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Quote> data)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingStateInitial value) initial,
    required TResult Function(LoadingStateLoading value) loading,
    required TResult Function(LoadingStateLoaded value) loaded,
    required TResult Function(LoadingStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingStateInitial value)? initial,
    TResult? Function(LoadingStateLoading value)? loading,
    TResult? Function(LoadingStateLoaded value)? loaded,
    TResult? Function(LoadingStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingStateInitial value)? initial,
    TResult Function(LoadingStateLoading value)? loading,
    TResult Function(LoadingStateLoaded value)? loaded,
    TResult Function(LoadingStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class LoadingStateError implements LoadingState {
  const factory LoadingStateError(final String message) = _$LoadingStateError;

  String get message;
  @JsonKey(ignore: true)
  _$$LoadingStateErrorCopyWith<_$LoadingStateError> get copyWith =>
      throw _privateConstructorUsedError;
}
