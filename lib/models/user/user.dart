import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  const User({
    required this.id,
    required this.name,
    required this.surname,
    required this.patronymic,
    this.email,
    required this.phone,
    this.createdAt,
    this.updatedAt,
    this.birthDate,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  @JsonKey(name: 'strId')
  final String id;
  final String name;
  final String surname;
  final String patronymic;
  final String? email;
  final String phone;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? birthDate;

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
