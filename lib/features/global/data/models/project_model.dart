import 'dart:convert';

import '../../domain/entities/entities.dart';

class ProjectModel extends ProjectEntity {
  const ProjectModel({
    super.name,
    super.platform,
    super.platformEn,
    super.desc,
    super.descEn,
    super.technologies,
    super.img,
    super.isMobile,
    super.url
  });

  factory ProjectModel.fromJson(String str) =>
      ProjectModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProjectModel.fromMap(Map<String, dynamic> json) => ProjectModel(
    name: json["name"],
    platform: json["platform"],
    platformEn: json["platform_en"],
    desc: json["desc"],
    descEn: json["desc_en"],
    technologies: json["technologies"],
    img: json["img"] == null ? [] : List<String>.from(json["img"]!.map((x) => x)),
    isMobile: json["isMobile"],
    url: json["url"],
  );

  @override
  Map<String, dynamic> toMap() => {
    "name": name,
    "platform": platform,
    "platform_en": platformEn,
    "desc": desc,
    "desc_en": descEn,
    "technologies": technologies,
    "img": img == null ? [] : List<dynamic>.from(img!.map((x) => x)),
    "isMobile": isMobile,
    "url" : url
  };
}