import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/utils/utils.dart';

class CustomAppBar extends StatelessWidget {
  final String pageName;
  const CustomAppBar({
    super.key, required this.pageName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Ink(
              decoration: BoxDecoration(
                color: BaseColor.blueClearly,
                borderRadius: BorderRadius.circular(5)
              ),
              width: 8.w,
              height: 8.w,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  Constants.backIcon,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Text(
            pageName,
            style: CustomText.textBlackSemiBold12,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            width: 8.w,
            height: 8.w,
          ),
          // Ink(
          //   decoration: BoxDecoration(
          //     color: BaseColor.blueClearly,
          //     borderRadius: BorderRadius.circular(5)
          //   ),
          //   width: 8.w,
          //   height: 8.w,
          //   child: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: SvgPicture.asset(
          //       Constants.menuIcon,
          //       fit: BoxFit.contain,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}