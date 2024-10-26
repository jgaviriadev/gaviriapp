import 'package:equatable/equatable.dart';

import '../../data/models/models.dart';

class StudyEntity extends Equatable {
    final String? name;
    final String? nameEn;
    final String? university;
    final String? date;
    final String? level;
    final String? levelEn;
    final String? location;

    const StudyEntity({
        this.name,
        this.nameEn,
        this.university,
        this.date,
        this.level,
        this.levelEn,
        this.location,
    });

    StudyEntity copyWith({
        String? name,
        String? nameEn,
        String? university,
        String? date,
        String? level,
        String? levelEn,
        String? location,
    }) => 
        StudyEntity(
            name: name ?? this.name,
            nameEn: nameEn ?? this.nameEn,
            university: university ?? this.university,
            date: date ?? this.date,
            level: level ?? this.level,
            levelEn: levelEn ?? this.levelEn,
            location: location ?? this.location,
        );

    factory StudyEntity.fromMap(Map<String, dynamic> json) => StudyEntity(
        name: json["name"],
        nameEn: json["name_en"],
        university: json["university"],
        date: json["date"],
        level: json["level"],
        levelEn: json["level_en"],
        location: json["location"],
    );

    Map<String, dynamic> toMap() => {
        "name": name,
        "name_en": nameEn,
        "university": university,
        "date": date,
        "level": level,
        "level_en": levelEn,
        "location": location,
    };
  
  factory StudyEntity.modelToEntity(StudyModel data) =>
        StudyEntity.fromMap(data.toMap());

  @override
    List<Object?> get props => [name, nameEn, university, date, level, levelEn, location];
}