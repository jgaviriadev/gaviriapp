  import 'package:equatable/equatable.dart';

import '../../data/models/models.dart';
  
  class ProjectEntity extends Equatable {
    final String? name;
    final String? platform;
    final String? platformEn;
    final String? desc;
    final String? descEn;
    final String? technologies;
    final List<String>? img;
    final bool? isMobile;
    final String? url;

    const ProjectEntity({
        this.name,
        this.platform,
        this.platformEn,
        this.desc,
        this.descEn,
        this.technologies,
        this.img,
        this.isMobile,
        this.url
    });

    ProjectEntity copyWith({
        String? name,
        String? platform,
        String? platformEn,
        String? desc,
        String? descEn,
        String? technologies,
        List<String>? img,
        bool? isMobile,
        String? url,
    }) => 
        ProjectEntity(
            name: name ?? this.name,
            platform: platform ?? this.platform,
            platformEn: platformEn ?? this.platformEn,
            desc: desc ?? this.desc,
            descEn: descEn ?? this.descEn,
            technologies: technologies ?? this.technologies,
            img: img ?? this.img,
            isMobile: isMobile ?? this.isMobile,
            url: url ?? this.url
        );

    factory ProjectEntity.fromMap(Map<String, dynamic> json) => ProjectEntity(
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

    factory ProjectEntity.modelToEntity(ProjectModel data) =>
        ProjectEntity.fromMap(data.toMap());

    @override
    List<Object?> get props => [name, platform, platformEn, desc, descEn, technologies, isMobile, url];
}