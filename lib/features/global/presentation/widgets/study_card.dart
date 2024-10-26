import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/utils/utils.dart';
import '../../domain/entities/study_entity.dart';

class StudyCard extends StatelessWidget {
  final StudyEntity study;
  const StudyCard({
    super.key,
    required this.study
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 2.h),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5)
        ),
        child: Padding(
          padding: EdgeInsets.all(2.h),
          child: Row(
            children: [
              SizedBox(
                width: 5.h,
                height: 5.h,
                child: SvgPicture.asset(
                  "assets/icons/education.svg"
                ),
              ),
              SizedBox(width: 3.h),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      (study.name ?? "").toUpperCase(),
                      style: CustomText.textBlueSemiBold10
                    ),
                    Text(
                      study.university ?? "",
                      style: CustomText.textBlackBold10
                    ),
                    Text(
                      study.date ?? "",
                      style: CustomText.textBlackNormal10
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}