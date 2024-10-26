import 'package:equatable/equatable.dart';
import '../../data/models/models.dart';
import 'entities.dart';
  
class UserEntity extends Equatable {
  final String? email;
  final String? name;
  final String? lastname;
  final String? jobTitle;
  final String? jobTitleEn;
  final int? age;
  final String? img;
  final List<ExperienceEntity>? experiences;
  final String? phone;
  final List<ProjectEntity>? projects;
  final List<SkillEntity>? skills;
  final List<StudyEntity>? studies;
  final String? summary;
  final String? github;
  final String? linkedin;

  const UserEntity({
    this.email,
    this.name,
    this.lastname,
    this.jobTitle,
    this.jobTitleEn,
    this.age,
    this.img,
    this.experiences,
    this.phone,
    this.projects,
    this.skills,
    this.studies,
    this.summary,
    this.github,
    this.linkedin
  });

  UserEntity copyWith({
    String? email,
    String? name,
    String? lastname,
    String? jobTitle,
    String? jobTitleEn,
    int? age,
    String? img,
    List<ExperienceEntity>? experiences,
    String? phone,
    List<ProjectEntity>? projects,
    List<SkillEntity>? skills,
    List<StudyEntity>? studies,
    String? summary,
    String? github,
    String? linkedin,
  }) => UserEntity(
    email: email ?? this.email,
    name: name ?? this.name,
    lastname: lastname ?? this.lastname,
    jobTitle: jobTitle ?? this.jobTitle,
    jobTitleEn: jobTitleEn ?? this.jobTitleEn,
    age: age ?? this.age,
    img: img ?? this.img,
    experiences: experiences ?? this.experiences,
    phone: phone ?? this.phone,
    projects: projects ?? this.projects,
    skills: skills ?? this.skills,
    studies: studies ?? this.studies,
    summary: summary ?? this.summary,
    github: github ?? this.github,
    linkedin: linkedin ?? this.linkedin,

  );

  factory UserEntity.fromMap(Map<String, dynamic> json) => UserEntity(
    email: json["email"],
    name: json["name"],
    lastname: json["lastname"],
    jobTitle: json["job_title"],
    jobTitleEn: json["job_title_en"],
    age: json["age"],
    img: json["img"],
    experiences: json["experiences"] == null ? [] : List<ExperienceEntity>.from(json["experiences"]!.map((x) => ExperienceEntity.fromMap(x))),
    phone: json["phone"],
    projects: json["projects"] == null ? [] : List<ProjectEntity>.from(json["projects"]!.map((x) => ProjectEntity.fromMap(x))),
    skills: json["skills"] == null ? [] : List<SkillEntity>.from(json["skills"]!.map((x) => SkillEntity.fromMap(x))),
    studies: json["studies"] == null ? [] : List<StudyEntity>.from(json["studies"]!.map((x) => StudyEntity.fromMap(x))),
    summary: json["summary"],
    linkedin: json["linkedin"],
    github: json["github"],
  );

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

  factory UserEntity.modelToEntity(UserModel data) =>
      UserEntity.fromMap(data.toMap());

  @override
  List<Object?> get props => [
    email,
    name,
    lastname,
    jobTitle,
    jobTitleEn,
    age,
    img,
    experiences,
    phone,
    projects,
    skills,
    studies,
    summary,
    linkedin,
    github,
  ];
}