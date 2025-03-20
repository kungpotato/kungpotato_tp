import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kungpotato/core/theme/app_color.dart';

class AppAppbar {
  static final appbar = AppBarTheme(
    backgroundColor: KpColorSeed.instance.primary,
    elevation: 0.r,
    // ใช้ .r ให้ responsive
    shadowColor: KpColorSeed.instance.primary,
    centerTitle: true,
    iconTheme: IconThemeData(
      color: Colors.white,
      size: 24.sp, // ปรับขนาดไอคอนให้ responsive
    ),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 16.sp, // ใช้ .sp ให้ขนาดตัวอักษรปรับอัตโนมัติ
      fontWeight: FontWeight.bold,
      fontFamily: GoogleFonts.prompt(fontStyle: FontStyle.normal).fontFamily,
    ),
  );
}
