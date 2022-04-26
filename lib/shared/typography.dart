import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:we_help_app/shared/shared.dart';

TextStyle textHeading1({Color? color}) {
  return GoogleFonts.dmSans(
    textStyle: TextStyle(
      color: color ?? blackColor,
      fontWeight: FontWeight.w700,
      fontSize: 24.sp,
    ),
  );
}

TextStyle textButtonNormal({Color? color}) {
  return GoogleFonts.dmSans(
    textStyle: TextStyle(
      color: color ?? whiteColor,
      fontWeight: FontWeight.w500,
      fontSize: 18.sp,
    ),
  );
}

TextStyle textFieldHintStyle({Color? color}) {
  return GoogleFonts.dmSans(
    textStyle: TextStyle(
      color: color ?? hintColor,
      fontWeight: FontWeight.w400,
      fontSize: 16.sp,
    ),
  );
}

TextStyle normalText({Color? color}) {
  return GoogleFonts.dmSans(
    textStyle: TextStyle(
      color: color ?? blackColor,
      fontWeight: FontWeight.w400,
      fontSize: 12.sp,
    ),
  );
}
