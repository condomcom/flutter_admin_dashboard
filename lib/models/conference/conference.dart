import 'package:json_annotation/json_annotation.dart';

part 'conference.g.dart';

@JsonSerializable()
class Conference {
  const Conference({
    required this.id,
    this.shortName,
    this.fullName,
    this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Conference.fromJson(Map<String, dynamic> json) =>
      _$ConferenceFromJson(json);

  @JsonKey(name: 'strId')
  final String id;
  final String? shortName;
  final String? fullName;
  final String? description;
  final DateTime createdAt;
  final DateTime updatedAt;

  Map<String, dynamic> toJson() => _$ConferenceToJson(this);
}
