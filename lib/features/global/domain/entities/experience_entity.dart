  import 'package:equatable/equatable.dart';

import '../../data/models/experience_model.dart';
  
  class ExperienceEntity extends Equatable {
    final String? company;
    final String? location;
    final String? locationEn;
    final String? beginning;
    final String? finished;
    final String? jobTitle;
    final List<String>? desc;
    final String? technologies;
  
    const ExperienceEntity({
      this.company,
      this.location,
      this.locationEn,
      this.beginning,
      this.finished,
      this.jobTitle,
      this.desc,
      this.technologies,
    });
  
    ExperienceEntity copyWith({
      String? company,
      String? location,
      String? locationEn,
      String? beginning,
      String? finished,
      String? jobTitle,
      List<String>? desc,
      String? technologies,
    }) => ExperienceEntity(
          company: company ?? this.company,
          location: location ?? this.location,
          locationEn: locationEn ?? this.locationEn,
          beginning: beginning ?? this.beginning,
          finished: finished ?? this.finished,
          jobTitle: jobTitle ?? this.jobTitle,
          desc: desc ?? this.desc,
          technologies: technologies ?? this.technologies,
        );
  
    factory ExperienceEntity.fromMap(Map<String, dynamic> json) => ExperienceEntity(
      company: json["company"],
      location: json["location"],
      locationEn: json["location_en"],
      beginning: json["beginning"],
      finished: json["finished"],
      jobTitle: json["job_title"],
      desc: json["desc"] == null ? [] : List<String>.from(json["desc"]!.map((x) => x)),
      technologies: json["technologies"],
    );
  
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
  
    factory ExperienceEntity.modelToEntity(ExperienceModel data) =>
        ExperienceEntity.fromMap(data.toMap());
  
    @override
    List<Object?> get props => [company,location, locationEn, beginning, beginning, finished, jobTitle, desc,technologies];
  }