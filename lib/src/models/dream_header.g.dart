// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dream_header.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DreamHeader _$DreamHeaderFromJson(Map<String, dynamic> json) => DreamHeader(
      id: json['BlogId'] as int? ?? 0,
      title: json['BlogTitle'] as String? ?? '',
    );

Map<String, dynamic> _$DreamHeaderToJson(DreamHeader instance) =>
    <String, dynamic>{
      'BlogId': instance.id,
      'BlogTitle': instance.title,
    };
