import 'package:freezed_annotation/freezed_annotation.dart';

part 'quote.g.dart';

/// todo-02-04: add this import to insert a generated file
part 'quote.freezed.dart';

/// todo-02-01: change this annotation into freezed
@freezed

/// todo-02-02: change the property and constructor into this code
class Quote with _$Quote {
  const factory Quote({
    required String id,
    required String en,
    required String author,
    required double rating,
  }) = _Quote;

  factory Quote.fromJson(Map<String, dynamic> json) => _$QuoteFromJson(json);

  /// todo-02-03: remove toJson method
}
