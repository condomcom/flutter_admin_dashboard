import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  const User({
    this.id,
    required this.name,
    this.surname,
    this.patronymic,
    this.email,
    this.phone,
    this.createdAt,
    this.updatedAt,
    this.birthDate,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  @JsonKey(name: 'strId')
  final String? id;
  final String? name;
  final String? surname;
  final String? patronymic;
  final String? email;
  final String? phone;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? birthDate;

  Map<String, dynamic> toJson() => _$UserToJson(this);

  User copyWith({
    String? id,
    String? name,
    String? surname,
    String? patronymic,
    String? email,
    String? phone,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? birthDate,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      surname: surname ?? this.surname,
      patronymic: patronymic ?? this.patronymic,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      birthDate: birthDate ?? this.birthDate,
    );
  }
}
