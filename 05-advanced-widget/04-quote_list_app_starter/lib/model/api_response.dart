import 'dart:convert';

import 'quote.dart';

class ApiResponse {
  final List<Quote> list;

  ApiResponse({
    required this.list,
  });

  factory ApiResponse.fromMap(data) {
    return ApiResponse(
      list: List<Quote>.from(data.map((x) => Quote.fromMap(x))),
    );
  }

  factory ApiResponse.fromJson(String source) =>
      ApiResponse.fromMap(json.decode(source));
}
