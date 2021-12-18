import 'package:json_annotation/json_annotation.dart';

part 'conference.g.dart';

@JsonSerializable()
class Conference {
  const Conference({
    this.id,
    this.shortName,
    this.fullName,
    this.description,
    this.createdAt,
    this.updatedAt,
  });

  factory Conference.fromJson(Map<String, dynamic> json) =>
      _$ConferenceFromJson(json);

  @JsonKey(name: 'strId')
  final String? id;
  final String? shortName;
  final String? fullName;
  final String? description;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Map<String, dynamic> toJson() => _$ConferenceToJson(this);

  Conference copyWith({
    String? id,
    String? shortName,
    String? fullName,
    String? description,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Conference(
      id: id ?? this.id,
      shortName: shortName ?? this.shortName,
      fullName: fullName ?? this.fullName,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
