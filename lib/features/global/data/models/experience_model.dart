import 'dart:convert';

import '../../domain/entities/experience_entity.dart';

class ExperienceModel extends ExperienceEntity {
  const ExperienceModel({
    super.company,
    super.location,
    super.locationEn,
    super.beginning,
    super.finished,
    super.jobTitle,
    super.desc,
    super.technologies,
  });

  factory ExperienceModel.fromJson(String str) =>
      ExperienceModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ExperienceModel.fromMap(Map<String, dynamic> json) => ExperienceModel(
    company: json["company"],
    location: json["location"],
    locationEn: json["location_en"],
    beginning: json["beginning"],
    finished: json["finished"],
    jobTitle: json["job_title"],
    desc: json["desc"] == null ? [] : List<String>.from(json["desc"]!.map((x) => x)),
    technologies: json["technologies"],
  );

  @override
  Map<String, dynamic> toMap() => {
    "company": company,
    "location": location,
    "location_en": locationEn,
    "beginning": beginning,
    "finished": finished,
    "job_title": jobTitle,
    "desc": desc == null ? [] : List<dynamic>.from(desc!.map((x) => x)),
    "technologies": technologies,
  };
}