import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class AppTextStyles{

  static TextStyle buttonTextStyle = GoogleFonts.inter(
    textStyle: const TextStyle(fontSize: 15,fontWeight: FontWeight.w800,color: AppColors.primaryWhiteColor),
  );
  static TextStyle buttonTextStyleW = GoogleFonts.inter(
    textStyle: const TextStyle(fontSize: 15,fontWeight: FontWeight.w800,color: AppColors.primaryColor),
  );

  static TextStyle headingStyle = GoogleFonts.inter(
    textStyle: const TextStyle(fontSize: 20,fontWeight: FontWeight.w800,color: AppColors.primaryColor),
  );
  static TextStyle textBStyle = GoogleFonts.inter(
    textStyle: const TextStyle(fontSize: 15,fontWeight: FontWeight.w600,color: Colors.black),
  );
}