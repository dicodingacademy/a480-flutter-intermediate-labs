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

  factory Quote.fromJson(Map<String, dynamic> map) {
    return Quote(
      id: map['id'] ?? '',
      en: map['en'] ?? '',
      author: map['author'] ?? '',
      rating: map['rating']?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'en': en,
        'author': author,
        'rating': rating,
      };
}
