import 'dart:convert';

class Quote {
  final String id;
  final String sr;
  final String en;
  final String author;
  final double rating;
  Quote({
    required this.id,
    required this.sr,
    required this.en,
    required this.author,
    required this.rating,
  });

  Quote copyWith({
    String? id,
    String? sr,
    String? en,
    String? author,
    double? rating,
  }) {
    return Quote(
      id: id ?? this.id,
      sr: sr ?? this.sr,
      en: en ?? this.en,
      author: author ?? this.author,
      rating: rating ?? this.rating,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'sr': sr,
      'en': en,
      'author': author,
      'rating': rating,
    };
  }

  factory Quote.fromMap(Map<String, dynamic> map) {
    return Quote(
      id: map['id'] ?? '',
      sr: map['sr'] ?? '',
      en: map['en'] ?? '',
      author: map['author'] ?? '',
      rating: map['rating']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Quote.fromJson(String source) => Quote.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Quote(id: $id, sr: $sr, en: $en, author: $author, rating: $rating)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Quote &&
      other.id == id &&
      other.sr == sr &&
      other.en == en &&
      other.author == author &&
      other.rating == rating;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      sr.hashCode ^
      en.hashCode ^
      author.hashCode ^
      rating.hashCode;
  }
}