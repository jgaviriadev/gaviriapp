import 'dart:convert';

import '../../domain/entities/skill_entity.dart';
class SkillModel extends SkillEntity {
  const SkillModel({
    super.name,
    super.img,
  });

  factory SkillModel.fromJson(String str) =>
      SkillModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SkillModel.fromMap(Map<String, dynamic> json) => SkillModel(
    name: json["name"],
    img: json["img"],
  );

  @override
  Map<String, dynamic> toMap() => {
    "name": name,
    "img": img,
  };
}