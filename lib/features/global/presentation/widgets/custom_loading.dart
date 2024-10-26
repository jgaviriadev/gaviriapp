import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/utils/constants.dart';

class CustomLoading extends StatelessWidget {
  final Color? color;
  const CustomLoading({super.key, this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: double.infinity,
      color: color ?? Colors.black.withOpacity(0.3),
      child: SizedBox(
        child: SizedBox(
          child: Image(
            image: AssetImage(Constants.loadingGIF),
            fit: BoxFit.cover,
            height: 5.h,
          ),
        ),
      ),
    );
  }
}