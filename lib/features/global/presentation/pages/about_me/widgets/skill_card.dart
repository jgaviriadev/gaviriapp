import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../core/utils/utils.dart';

class SkillCard extends StatelessWidget {
  const SkillCard({
    super.key, 
    required this.name, 
    required this.url,
  });

  final String name;
  final String url;
  
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      color: Colors.white,
      elevation: 0,
      child: Padding(
        padding: EdgeInsets.only(left: 1.h, right: 1.h, top: 1.h, bottom: 1.h),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CachedNetworkImage(
              width: 2.h,
              height: 2.h,
              imageUrl: url,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error, color: Colors.amber,),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 1.h),
              child: Container(
                width: 0.5,
                height: 1.5.h,
                color: BaseColor.grayText,
              ),
            ),
            Text(
              name,
              style: CustomText.textBlackBold10
            ),
          ],
        ),
      ),
    );
  }
}