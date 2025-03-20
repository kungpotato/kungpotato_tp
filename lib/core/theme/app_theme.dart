import 'package:color_type_converter/color_type_converter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kungpotato/core/theme/app_appbar.dart';
import 'package:kungpotato/core/theme/app_color.dart';

final inputDecoration = InputDecorationTheme(
  border: const UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.grey),
  ),
  focusColor: KpColorSeed.instance.primary,
  filled: true,
  isDense: true,
  labelStyle: TextStyle(color: Colors.black87, fontSize: 14.sp),
  // ใช้ .sp
  hintStyle: TextStyle(color: Colors.black87, fontSize: 14.sp),
  fillColor: KpColorSeed.instance.background,
  focusedBorder: const UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.grey),
  ),
  enabledBorder: const UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.grey),
  ),
  errorBorder: const UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.red),
  ),
  focusedErrorBorder: const UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.red),
  ),
  outlineBorder: const BorderSide(color: Colors.grey),
  prefixStyle: TextStyle(color: KpColorSeed.instance.primary),
  prefixIconColor: Colors.grey,
);

class MyThemes {
  static final lightTheme = ThemeData(
    useMaterial3: false,
    colorScheme: ColorScheme.light(
      primary: KpColorSeed.instance.primary,
      surface: KpColorSeed.instance.background,
      secondary: KpColorSeed.instance.secondary,
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
      size: 16.sp, // ใช้ .sp
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.all(KpColorSeed.instance.primary),
    ),
    primaryColor: KpColorSeed.instance.primary,
    primarySwatch:
        ColorConverter<MaterialColor>().convert(KpColorSeed.instance.primary),
    fontFamily: GoogleFonts.prompt(fontStyle: FontStyle.normal).fontFamily,
    brightness: Brightness.light,
    appBarTheme: AppAppbar.appbar,
    scaffoldBackgroundColor: KpColorSeed.instance.background,
    buttonTheme: ButtonThemeData(
      buttonColor: KpColorSeed.instance.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r), // ใช้ .r ให้ responsive
        side: BorderSide(color: KpColorSeed.instance.primary),
      ),
      textTheme: ButtonTextTheme.primary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: KpColorSeed.instance.primary,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r), // ใช้ .r
        ),
        disabledBackgroundColor: Colors.grey,
        disabledForegroundColor: Colors.black,
      ),
    ),
    textTheme: TextTheme(
      titleMedium: TextStyle(
        fontSize: 16.sp,
        color: KpColorSeed.instance.front,
      ),
      titleLarge: TextStyle(
        fontSize: 20.sp,
        color: KpColorSeed.instance.front,
      ),
      titleSmall: TextStyle(
        fontSize: 14.sp,
        color: KpColorSeed.instance.front,
      ),
      bodySmall: TextStyle(
        fontSize: 12.sp,
        color: KpColorSeed.instance.front,
      ),
      bodyLarge: TextStyle(
        fontSize: 18.sp,
        color: KpColorSeed.instance.front,
      ),
      bodyMedium: TextStyle(
        fontSize: 16.sp,
        color: KpColorSeed.instance.front,
      ),
      displayLarge: TextStyle(
        fontSize: 34.sp,
        color: KpColorSeed.instance.front,
      ),
      displayMedium: TextStyle(
        fontSize: 28.sp,
        color: KpColorSeed.instance.front,
      ),
      displaySmall: TextStyle(
        fontSize: 24.sp,
        color: KpColorSeed.instance.front,
      ),
      headlineLarge: TextStyle(
        fontSize: 22.sp,
        color: KpColorSeed.instance.front,
      ),
      headlineMedium: TextStyle(
        fontSize: 20.sp,
        color: KpColorSeed.instance.front,
      ),
      headlineSmall: TextStyle(
        fontSize: 18.sp,
        color: KpColorSeed.instance.front,
      ),
      labelLarge: TextStyle(
        fontSize: 16.sp,
        color: KpColorSeed.instance.front,
      ),
      labelMedium: TextStyle(
        fontSize: 14.sp,
        color: KpColorSeed.instance.front,
      ),
      labelSmall: TextStyle(
        fontSize: 12.sp,
        color: KpColorSeed.instance.front,
      ),
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: KpColorSeed.instance.primary,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: KpColorSeed.instance.primary,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
    ),
    inputDecorationTheme: inputDecoration,
    textSelectionTheme:
        TextSelectionThemeData(cursorColor: KpColorSeed.instance.primary),
    datePickerTheme: DatePickerThemeData(
      backgroundColor: KpColorSeed.instance.background,
      headerBackgroundColor: KpColorSeed.instance.primary,
      todayBorder: BorderSide(
        color: KpColorSeed.instance.primary,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
          fontSize: 14.sp,
        ),
        foregroundColor: KpColorSeed.instance.primary,
      ),
    ),
    dropdownMenuTheme:
        DropdownMenuThemeData(inputDecorationTheme: inputDecoration),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: KpColorSeed.instance.primary,
      extendedTextStyle: TextStyle(color: Colors.white, fontSize: 14.sp),
      foregroundColor: Colors.white,
    ),
  );

  static final darkTheme = ThemeData(
    primarySwatch: Colors.blueGrey,
    fontFamily: GoogleFonts.prompt(fontStyle: FontStyle.normal).fontFamily,
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.blueGrey,
    ),
    textTheme: TextTheme(
      titleMedium: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: ColorConverter<MaterialColor>().convert(
        Colors.blueGrey,
      ),
    ),
  );
}
