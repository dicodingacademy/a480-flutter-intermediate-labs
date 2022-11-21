import 'quote.dart';

class AssetResponse {
  final List<Quote> list;

  AssetResponse({
    required this.list,
  });

  Map<String, dynamic> toJson() {
    return {
      'list_quotes': list.map((x) => x.toJson()).toList(),
    };
  }

  factory AssetResponse.fromJson(Map<String, dynamic> map) {
    return AssetResponse(
      list: List<Quote>.from(map['list_quotes']?.map((x) => Quote.fromJson(x))),
    );
  }
}
