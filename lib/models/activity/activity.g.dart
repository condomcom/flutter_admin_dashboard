// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Activity _$ActivityFromJson(Map<String, dynamic> json) => Activity(
      json['strId'] as String,
      json['conferenceStrId'] as String,
      json['shortName'] as String,
      json['fullName'] as String,
      json['participantsLimit'] as int,
      json['description'] as String,
      DateTime.parse(json['createdAt'] as String),
      DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$ActivityToJson(Activity instance) => <String, dynamic>{
      'strId': instance.id,
      'conferenceStrId': instance.conferenceId,
      'shortName': instance.shortName,
      'fullName': instance.fullName,
      'participantsLimit': instance.participantsLimit,
      'description': instance.description,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
