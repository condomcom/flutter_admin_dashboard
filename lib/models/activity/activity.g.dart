// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Activity _$ActivityFromJson(Map<String, dynamic> json) => Activity(
      id: json['strId'] as String?,
      conferenceId: json['conferenceStrId'] as String?,
      shortName: json['shortName'] as String?,
      fullName: json['fullName'] as String?,
      participantsLimit: json['participantsLimit'] as int?,
      description: json['description'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      startsAt: json['startsAt'] == null
          ? null
          : DateTime.parse(json['startsAt'] as String),
      finishesAt: json['finishesAt'] == null
          ? null
          : DateTime.parse(json['finishesAt'] as String),
    );

Map<String, dynamic> _$ActivityToJson(Activity instance) => <String, dynamic>{
      'strId': instance.id,
      'conferenceStrId': instance.conferenceId,
      'shortName': instance.shortName,
      'fullName': instance.fullName,
      'participantsLimit': instance.participantsLimit,
      'description': instance.description,
      'startsAt': instance.startsAt?.toIso8601String(),
      'finishesAt': instance.finishesAt?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
