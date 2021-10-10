import 'package:json_annotation/json_annotation.dart';

part 'conference.g.dart';

@JsonSerializable()
class Conference {
  const Conference({
    required this.id,
    required this.shortName,
    required this.fullName,
    required this.description,
  });

  factory Conference.fromJson(Map<String, dynamic> json) =>
      _$ConferenceFromJson(json);

  @JsonKey(name: 'strId')
  final String id;
  final String shortName;
  final String fullName;
  final String description;

  Map<String, dynamic> toJson() => _$ConferenceToJson(this);
}
