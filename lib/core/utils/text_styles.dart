import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import 'base_color.dart';

class CustomText {
  CustomText._(); 

  // --- text styles app --- //


  // --- BLACK --- //
  static TextStyle get textBlackSemiBold14 => GoogleFonts.inter(
    color: BaseColor.black,
    fontWeight: FontWeight.w700,
    fontSize: 14.sp,
  );

  static TextStyle get textBlackSemiBold12 => GoogleFonts.inter(
    color: BaseColor.black,
    fontWeight: FontWeight.w700,
    fontSize: 12.sp,
  );

  static TextStyle get textBlackSemiBold10 => GoogleFonts.inter(
    color: BaseColor.black,
    fontWeight: FontWeight.w700,
    fontSize: 10.sp,
  );

  static TextStyle get textBlackNormal10 => GoogleFonts.inter(
    color: BaseColor.black,
    fontWeight: FontWeight.normal,
    fontSize: 10.sp,
  );

  static TextStyle get textBlackBold10 => GoogleFonts.inter(
    color: BaseColor.black,
    fontWeight: FontWeight.bold,
    fontSize: 10.sp,
  );

  static TextStyle get textBlackBold8 => GoogleFonts.inter(
    color: BaseColor.black,
    fontWeight: FontWeight.bold,
    fontSize: 8.sp,
  );

   // --- GRAY --- //
  static TextStyle get textGrayNormal10 => GoogleFonts.inter(
    color: BaseColor.grayText,
    fontWeight: FontWeight.normal,
    fontSize: 10.sp,
  );

   // --- BLUE --- //
  static TextStyle get textBlueSemiBold10 => GoogleFonts.inter(
    color: BaseColor.blue,
    fontWeight: FontWeight.w700,
    fontSize: 10.sp,
  );

  static TextStyle get textBlueBold10 => GoogleFonts.inter(
    color: BaseColor.blue,
    fontWeight: FontWeight.bold,
    fontSize: 10.sp,
  );

   // --- WHITE --- //
  static TextStyle get textWhiteBold10 => GoogleFonts.inter(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 10.sp,
  );

  static TextStyle get textWhiteBold8 => GoogleFonts.inter(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 8.sp,
  );

}