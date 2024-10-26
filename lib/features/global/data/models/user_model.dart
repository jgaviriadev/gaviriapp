import 'dart:convert';

import '../../domain/entities/entities.dart';
import 'models.dart';

class UserModel extends UserEntity {
  const UserModel({
    super.email,
    super.name,
    super.lastname,
    super.jobTitle,
    super.jobTitleEn,
    super.age,
    super.img,
    super.phone,
    super.summary,
    super.github,
    super.linkedin,
    List<ExperienceModel>? super.experiences,
    List<ProjectModel>? super.projects,
    List<SkillModel>? super.skills,
    List<StudyModel>? super.studies,
  });

  factory UserModel.fromJson(String str) =>
      UserModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
    email: json["email"],
    name: json["name"],
    lastname: json["lastname"],
    jobTitle: json["job_title"],
    jobTitleEn: json["job_title_en"],
    age: json["age"],
    img: json["img"],
    experiences: json["experiences"] == null ? [] : List<ExperienceModel>.from(json["experiences"]!.map((x) => ExperienceModel.fromMap(x))),
    phone: json["phone"],
    projects: json["projects"] == null ? [] : List<ProjectModel>.from(json["projects"]!.map((x) => ProjectModel.fromMap(x))),
    skills: json["skills"] == null ? [] : List<SkillModel>.from(json["skills"]!.map((x) => SkillModel.fromMap(x))),
    studies: json["studies"] == null ? [] : List<StudyModel>.from(json["studies"]!.map((x) => StudyModel.fromMap(x))),
    summary: json["summary"],
    linkedin: json["linkedin"],
    github: json["github"],
  );

  @override
  Map<String, dynamic> toMap() => {
    "email" : email,
    "name": name,
    "lastname": lastname,
    "job_title": jobTitle,
    "job_title_en": jobTitleEn,
    "age": age,
    "img": img,
    "experiences": experiences == null ? [] : List<dynamic>.from(experiences!.map((x) => x.toMap())),
    "phone": phone,
    "projects": projects == null ? [] : List<dynamic>.from(projects!.map((x) => x.toMap())),
    "skills": skills == null ? [] : List<dynamic>.from(skills!.map((x) => x.toMap())),
    "studies": studies == null ? [] : List<dynamic>.from(studies!.map((x) => x.toMap())),
    "summary": summary,
    "github": github,
    "linkedin": linkedin,
  };
}