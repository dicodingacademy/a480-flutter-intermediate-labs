// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quote.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Quote _$QuoteFromJson(Map<String, dynamic> json) => Quote(
      id: json['id'] as String,
      en: json['en'] as String,
      author: json['author'] as String,
      rating: (json['rating'] as num).toDouble(),
    );

Map<String, dynamic> _$QuoteToJson(Quote instance) => <String, dynamic>{
      'id': instance.id,
      'en': instance.en,
      'author': instance.author,
      'rating': instance.rating,
    };
