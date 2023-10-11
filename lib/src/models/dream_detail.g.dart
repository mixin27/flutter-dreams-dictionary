// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dream_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DreamDetail _$DreamDetailFromJson(Map<String, dynamic> json) => DreamDetail(
      id: json['BlogDetailId'] as int? ?? 0,
      headerId: json['BlogId'] as int? ?? 0,
      content: json['BlogContent'] as String? ?? '',
    );

Map<String, dynamic> _$DreamDetailToJson(DreamDetail instance) =>
    <String, dynamic>{
      'BlogDetailId': instance.id,
      'BlogId': instance.headerId,
      'BlogContent': instance.content,
    };
