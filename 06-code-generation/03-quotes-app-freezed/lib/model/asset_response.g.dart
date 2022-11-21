// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AssetResponse _$$_AssetResponseFromJson(Map<String, dynamic> json) =>
    _$_AssetResponse(
      list: (json['list_quotes'] as List<dynamic>)
          .map((e) => Quote.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_AssetResponseToJson(_$_AssetResponse instance) =>
    <String, dynamic>{
      'list_quotes': instance.list,
    };
