import 'package:floor/floor.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dream_header.g.dart';

@Entity(tableName: 'DreamHeader')
@JsonSerializable()
class DreamHeader {
  @JsonKey(name: 'BlogId', defaultValue: 0)
  @primaryKey
  @ColumnInfo(name: 'id')
  final int id;

  @JsonKey(name: 'BlogTitle', defaultValue: '')
  @ColumnInfo(name: 'title')
  final String title;

  const DreamHeader({required this.id, required this.title});

  factory DreamHeader.fromJson(Map<String, dynamic> json) =>
      _$DreamHeaderFromJson(json);

  Map<String, dynamic> toJson() => _$DreamHeaderToJson(this);

  DreamHeader copyWith({
    int? id,
    String? title,
  }) {
    return DreamHeader(
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }

  @override
  String toString() => 'DreamHeader(id: $id, title: $title)';

  @override
  bool operator ==(covariant DreamHeader other) {
    if (identical(this, other)) return true;

    return other.id == id && other.title == title;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode;
}
