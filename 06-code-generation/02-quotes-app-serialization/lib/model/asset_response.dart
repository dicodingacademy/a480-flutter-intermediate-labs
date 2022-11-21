import 'package:json_annotation/json_annotation.dart';
import 'quote.dart';

/// todo-03-03: import a dart file to insert generated file
part 'asset_response.g.dart';

/// todo-03-01: add this annotation to indicate Json Serializable class
@JsonSerializable()
class AssetResponse {
  /// todo-03-04: change the default key into teh correct one
  @JsonKey(name: "list_quotes")
  final List<Quote> list;

  AssetResponse({
    required this.list,
  });

  /// todo-03-02: change the [fromJson] and [toJson] methods into this code
  factory AssetResponse.fromJson(json) => _$AssetResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AssetResponseToJson(this);
}
