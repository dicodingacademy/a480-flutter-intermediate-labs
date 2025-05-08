// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AssetResponse _$AssetResponseFromJson(Map<String, dynamic> json) =>
    _AssetResponse(
      list:
          (json['list_quotes'] as List<dynamic>)
              .map((e) => Quote.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$AssetResponseToJson(_AssetResponse instance) =>
    <String, dynamic>{'list_quotes': instance.list};
