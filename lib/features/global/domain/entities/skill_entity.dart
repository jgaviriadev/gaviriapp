import 'package:equatable/equatable.dart';

import '../../data/models/skill_model.dart';

class SkillEntity  extends Equatable {
    final String? name;
    final String? img;

    const SkillEntity({
        this.name,
        this.img,
    });

    SkillEntity copyWith({
        String? name,
        String? img,
    }) => 
        SkillEntity(
            name: name ?? this.name,
            img: img ?? this.img,
        );

    factory SkillEntity.fromMap(Map<String, dynamic> json) => SkillEntity(
        name: json["name"],
        img: json["img"],
    );

    Map<String, dynamic> toMap() => {
        "name": name,
        "img": img,
    };

    factory SkillEntity.modelToEntity(SkillModel data) =>
        SkillEntity.fromMap(data.toMap());

    @override
    List<Object?> get props => [name, img];
}