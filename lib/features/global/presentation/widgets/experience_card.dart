import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/utils/utils.dart';
import '../../domain/entities/entities.dart';

class ExperienceCard extends StatefulWidget {
  final ExperienceEntity experience;
  const ExperienceCard({
    super.key, required this.experience
  });


  @override
  State<ExperienceCard> createState() => _ExperienceCardState();
}

class _ExperienceCardState extends State<ExperienceCard> {
  bool bodyVisible = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 2.h),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5)
        ),
        child: Padding(
          padding: EdgeInsets.all(2.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: BaseColor.blueClearly,
                  borderRadius: BorderRadius.circular(5)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.circle,
                        size: 10,
                        color: BaseColor.blue,
                      ),
                      SizedBox(width: 2.w),
                      Text(
                        widget.experience.jobTitle ?? "",
                        style: CustomText.textBlueBold10
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 1.h),
              Row(
                children: [
                  Text(
                    widget.experience.company ?? "",
                    style: CustomText.textBlackSemiBold10,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 1.h),
                    child: SizedBox(
                      height: 2.h,
                      child: VerticalDivider(
                        width: 2,
                        color: BaseColor.grayText,
                      ),
                    ),
                  ),
                  Text(
                    "${widget.experience.beginning ?? ""} - ${widget.experience.finished ?? ""}",
                    style: CustomText.textBlackNormal10,
                  )
                ],
              ),
              SizedBox(height: 2.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: widget.experience.desc!.map((e) => Padding(
                    padding: EdgeInsets.only(bottom: 1.h),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 1.h),
                          child: Icon(
                            Icons.circle,
                            size: 8,
                            color: BaseColor.black,
                          ),
                        ),
                        SizedBox(width: 2.w),
                        Expanded(
                          child: Text(
                            e,
                            style: CustomText.textBlackNormal10,
                            textAlign: TextAlign.justify,
                          )
                        ),
                      ],
                    ),
                  ),).toList()
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}