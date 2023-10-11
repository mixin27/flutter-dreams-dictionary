import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:dreams_dictionary/src/models/dream_detail.dart';
import 'package:dreams_dictionary/src/models/dream_header.dart';

part 'dream_dictionary.g.dart';

@JsonSerializable(explicitToJson: true)
class DreamDictionary {
  @JsonKey(name: 'BlogHeader', defaultValue: [])
  final List<DreamHeader> header;

  @JsonKey(name: 'BlogDetail', defaultValue: [])
  final List<DreamDetail> details;

  const DreamDictionary({
    required this.header,
    required this.details,
  });

  factory DreamDictionary.fromJson(Map<String, dynamic> json) =>
      _$DreamDictionaryFromJson(json);

  DreamDictionary copyWith({
    List<DreamHeader>? header,
    List<DreamDetail>? details,
  }) {
    return DreamDictionary(
      header: header ?? this.header,
      details: details ?? this.details,
    );
  }

  @override
  String toString() => 'DreamDictionary(header: $header, details: $details)';

  @override
  bool operator ==(covariant DreamDictionary other) {
    if (identical(this, other)) return true;

    return listEquals(other.header, header) &&
        listEquals(other.details, details);
  }

  @override
  int get hashCode => header.hashCode ^ details.hashCode;
}
