import 'package:freezed_annotation/freezed_annotation.dart' hide JsonKey;
import 'package:json_annotation/json_annotation.dart';

import 'quote.dart';
part 'asset_response.g.dart';

/// todo-03-04: add this import to insert a generated file
part 'asset_response.freezed.dart';

/// todo-03-01: change this annotation into freezed
@freezed

/// todo-03-02: change the property and constructor into this code
class AssetResponse with _$AssetResponse {
  const factory AssetResponse({
    @JsonKey(name: "list_quotes") required List<Quote> list,
  }) = _AssetResponse;

  factory AssetResponse.fromJson(json) => _$AssetResponseFromJson(json);

  /// todo-03-03: remove toJson method
}
