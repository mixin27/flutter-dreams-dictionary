// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dream_dictionary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DreamDictionary _$DreamDictionaryFromJson(Map<String, dynamic> json) =>
    DreamDictionary(
      header: (json['BlogHeader'] as List<dynamic>?)
              ?.map((e) => DreamHeader.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      details: (json['BlogDetail'] as List<dynamic>?)
              ?.map((e) => DreamDetail.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$DreamDictionaryToJson(DreamDictionary instance) =>
    <String, dynamic>{
      'BlogHeader': instance.header.map((e) => e.toJson()).toList(),
      'BlogDetail': instance.details.map((e) => e.toJson()).toList(),
    };
