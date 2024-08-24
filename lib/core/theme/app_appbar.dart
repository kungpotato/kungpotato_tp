import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kungpotato/core/theme/app_color.dart';

class AppAppbar {
  static final appbar = AppBarTheme(
    backgroundColor: KpColorSeed.instance.primary,
    elevation: 0,
    shadowColor: KpColorSeed.instance.primary,
    centerTitle: true,
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.bold,
      fontFamily: GoogleFonts.prompt(fontStyle: FontStyle.normal).fontFamily,
    ),
  );
}
