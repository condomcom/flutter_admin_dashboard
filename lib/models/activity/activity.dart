import 'package:json_annotation/json_annotation.dart';

part 'activity.g.dart';

@JsonSerializable()
class Activity {
  const Activity(
    this.id,
    this.conferenceId,
    this.shortName,
    this.fullName,
    this.participantsLimit,
    this.description,
    this.createdAt,
    this.updatedAt,
  );

  factory Activity.fromJson(Map<String, dynamic> json) =>
      _$ActivityFromJson(json);

  @JsonKey(name: 'strId')
  final String id;
  @JsonKey(name: 'conferenceStrId')
  final String conferenceId;
  final String shortName;
  final String fullName;
  final int participantsLimit;
  final String description;
  final DateTime createdAt;
  final DateTime updatedAt;

  Map<String, dynamic> toJson() => _$ActivityToJson(this);
}