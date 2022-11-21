import 'package:json_annotation/json_annotation.dart';

/// todo-02-03: import a dart file to insert generated file
part 'quote.g.dart';

/// todo-02-01: add this annotation to indicate Json Serializable class
@JsonSerializable()
class Quote {
  final String id;
  final String en;
  final String author;
  final double rating;

  Quote({
    required this.id,
    required this.en,
    required this.author,
    required this.rating,
  });

  /// todo-02-02: change the [fromJson] and [toJson] methods into this code
  factory Quote.fromJson(Map<String, dynamic> json) => _$QuoteFromJson(json);

  Map<String, dynamic> toJson() => _$QuoteToJson(this);
}
