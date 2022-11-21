/// todo-04-01: change LoadingState into a new Union class
import 'package:freezed_annotation/freezed_annotation.dart';

import 'quote.dart';
part 'loading_state.freezed.dart';

@freezed
class LoadingState with _$LoadingState {
  const factory LoadingState.initial() = LoadingStateInitial;
  const factory LoadingState.loading() = LoadingStateLoading;
  const factory LoadingState.loaded(List<Quote> data) = LoadingStateLoaded;
  const factory LoadingState.error(String message) = LoadingStateError;
}
