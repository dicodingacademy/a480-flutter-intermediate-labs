import 'dart:convert';

class Quote {
  final String id;
  final String quote;
  final String author;

  Quote({
    required this.id,
    required this.quote,
    required this.author,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'quote': quote,
      'author': author,
    };
  }

  factory Quote.fromMap(Map<String, dynamic> map) {
    return Quote(
      id: map['id'] ?? '',
      quote: map['quote'] ?? '',
      author: map['author'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Quote.fromJson(String source) => Quote.fromMap(json.decode(source));

  @override
  String toString() => 'Quote(id: $id, quote: $quote, author: $author)';
}

final quotes = [
  Quote(
    id: "1",
    quote:
        "Cleaning code does NOT take time. NOT cleaning code does take time.",
    author: "Robert C. Martin",
  ),
  Quote(
    id: "2",
    quote: "Debugging time increases as a square of the program's size.",
    author: "Chris Wenham",
  ),
  Quote(
    id: "3",
    quote: "Adding manpower to a late software project makes it later.",
    author: "Edsger W. Dijkstra",
  ),
  Quote(
    id: "4",
    quote: "Deleted code is debugged code.",
    author: "Jeff Sickel",
  ),
  Quote(
    id: "5",
    quote:
        "A program that produces incorrect results twice as fast is infinitely slower.",
    author: "John Ousterhout",
  ),
];
