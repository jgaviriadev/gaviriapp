import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/utils/text_styles.dart';

class HomeOption extends StatelessWidget {
  final String text;
  final String svgIconPath;
  final void Function()? onTap;
  const HomeOption({
    super.key, 
    required this.text, 
    required this.svgIconPath, 
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(5),
      onTap: onTap,
      child: Ink(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5)
        ),
        width: 42.w,
        height: 34.w,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF1FAFC),
                  borderRadius: BorderRadius.circular(5)
                ),
                width: 16.w,
                height: 13.w,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    svgIconPath,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                text,
                style: CustomText.textBlackNormal10
              ),
            ],
          ),
        ),
      ),
    );
  }
}