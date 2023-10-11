import 'package:floor/floor.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dream_detail.g.dart';

@Entity(tableName: 'DreamDetail')
@JsonSerializable()
class DreamDetail {
  @JsonKey(name: 'BlogDetailId', defaultValue: 0)
  @primaryKey
  final int id;

  @JsonKey(name: 'BlogId', defaultValue: 0)
  final int headerId;

  @JsonKey(name: 'BlogContent', defaultValue: '')
  final String content;

  const DreamDetail({
    required this.id,
    required this.headerId,
    required this.content,
  });

  factory DreamDetail.fromJson(Map<String, dynamic> json) =>
      _$DreamDetailFromJson(json);

  Map<String, dynamic> toJson() => _$DreamDetailToJson(this);

  DreamDetail copyWith({
    int? id,
    int? headerId,
    String? content,
  }) {
    return DreamDetail(
      id: id ?? this.id,
      headerId: headerId ?? this.headerId,
      content: content ?? this.content,
    );
  }

  @override
  String toString() =>
      'DreamDetail(id: $id, headerId: $headerId, content: $content)';

  @override
  bool operator ==(covariant DreamDetail other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.headerId == headerId &&
        other.content == content;
  }

  @override
  int get hashCode => id.hashCode ^ headerId.hashCode ^ content.hashCode;
}
