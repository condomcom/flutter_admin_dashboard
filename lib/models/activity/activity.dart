import 'package:json_annotation/json_annotation.dart';

part 'activity.g.dart';

@JsonSerializable()
class Activity {
  const Activity({
    this.id,
    this.conferenceId,
    this.shortName,
    this.fullName,
    this.participantsLimit,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.startsAt,
    this.finishesAt,
  });

  factory Activity.fromJson(Map<String, dynamic> json) =>
      _$ActivityFromJson(json);

  @JsonKey(name: 'strId')
  final String? id;
  @JsonKey(name: 'conferenceStrId')
  final String? conferenceId;
  final String? shortName;
  final String? fullName;
  final int? participantsLimit;
  final String? description;
  final DateTime? startsAt;
  final DateTime? finishesAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Map<String, dynamic> toJson() => _$ActivityToJson(this);

  Activity copyWith({
    String? id,
    String? conferenceId,
    String? shortName,
    String? fullName,
    int? participantsLimit,
    String? description,
    DateTime? startsAt,
    DateTime? finishesAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Activity(
      id: id ?? this.id,
      conferenceId: conferenceId ?? this.conferenceId,
      shortName: shortName ?? this.shortName,
      fullName: fullName ?? this.fullName,
      participantsLimit: participantsLimit ?? this.participantsLimit,
      description: description ?? this.description,
      startsAt: startsAt ?? this.startsAt,
      finishesAt: finishesAt ?? this.finishesAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
