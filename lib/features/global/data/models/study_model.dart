import 'dart:convert';

import '../../domain/entities/entities.dart';

class StudyModel extends StudyEntity {
  const StudyModel({
    super.name,
    super.nameEn,
    super.university,
    super.date,
    super.level,
    super.levelEn,
    super.location,
  });

  factory StudyModel.fromJson(String str) =>
      StudyModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory StudyModel.fromMap(Map<String, dynamic> json) => StudyModel(
    name: json["name"],
    nameEn: json["name_en"],
    university: json["university"],
    date: json["date"],
    level: json["level"],
    levelEn: json["level_en"],
    location: json["location"],
  );

  @override
  Map<String, dynamic> toMap() => {
    "name": name,
    "name_en": nameEn,
    "university": university,
    "date": date,
    "level": level,
    "level_en": levelEn,
    "location": location,
  };
}