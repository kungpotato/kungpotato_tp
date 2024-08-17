import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kungpotato/core/theme/app_appbar.dart';
import 'package:kungpotato/core/theme/app_color.dart';
import 'package:kungpotato/helpers/utils.dart';


final inputDecoration = InputDecorationTheme(
  border: const OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey),
    borderRadius: BorderRadius.all(Radius.circular(20)),
  ),
  focusColor: ColorSeed.primary.color,
  filled: true,
  isDense: true,
  labelStyle: const TextStyle(color: Colors.black87, fontSize: 14),
  hintStyle: const TextStyle(color: Colors.black87, fontSize: 14),
  fillColor: ColorSeed.background.color,
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: const BorderSide(color: Colors.grey),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: const BorderSide(color: Colors.grey),
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: const BorderSide(color: Colors.red),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: const BorderSide(color: Colors.red),
  ),
  outlineBorder: const BorderSide(color: Colors.grey),
  prefixStyle: TextStyle(color: ColorSeed.primary.color),
  prefixIconColor: Colors.grey,
);

class MyThemes {
  static final lightTheme = ThemeData(
    useMaterial3: false,
    colorScheme: ColorScheme.light(
      primary: ColorSeed.primary.color,
      surface: ColorSeed.background.color,
      secondary: ColorSeed.secondary.color,
    ),
    iconTheme: const IconThemeData(
      color: Colors.white,
      size: 16,
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.all(ColorSeed.primary.color),
    ),
    primaryColor: ColorSeed.primary.color,
    primarySwatch: colorToMaterialColor(ColorSeed.primary.color),
    fontFamily: GoogleFonts.prompt(fontStyle: FontStyle.normal).fontFamily,
    brightness: Brightness.light,
    appBarTheme: AppAppbar.appbar,
    scaffoldBackgroundColor: ColorSeed.background.color,
    buttonTheme: ButtonThemeData(
      buttonColor: ColorSeed.primary.color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: ColorSeed.primary.color),
      ),
      textTheme: ButtonTextTheme.primary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorSeed.primary.color,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        disabledBackgroundColor: Colors.grey,
        disabledForegroundColor: Colors.black,
      ),
    ),
    textTheme: TextTheme(
      titleMedium: TextStyle(
        fontSize: 16,
        color: ColorSeed.front.color,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        color: ColorSeed.front.color,
      ),
      titleSmall: TextStyle(
        fontSize: 14,
        color: ColorSeed.front.color,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        color: ColorSeed.front.color,
      ),
      bodyLarge: TextStyle(
        fontSize: 18,
        color: ColorSeed.front.color,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        color: ColorSeed.front.color,
      ),
      displayLarge: TextStyle(
        fontSize: 34,
        color: ColorSeed.front.color,
      ),
      displayMedium: TextStyle(
        fontSize: 28,
        color: ColorSeed.front.color,
      ),
      displaySmall: TextStyle(
        fontSize: 24,
        color: ColorSeed.front.color,
      ),
      headlineLarge: TextStyle(
        fontSize: 22,
        color: ColorSeed.front.color,
      ),
      headlineMedium: TextStyle(
        fontSize: 20,
        color: ColorSeed.front.color,
      ),
      headlineSmall: TextStyle(
        fontSize: 18,
        color: ColorSeed.front.color,
      ),
      labelLarge: TextStyle(
        fontSize: 16,
        color: ColorSeed.front.color,
      ),
      labelMedium: TextStyle(
        fontSize: 14,
        color: ColorSeed.front.color,
      ),
      labelSmall: TextStyle(
        fontSize: 12,
        color: ColorSeed.front.color,
      ),
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: ColorSeed.primary.color,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: ColorSeed.primary.color,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
    ),
    inputDecorationTheme: inputDecoration,
    textSelectionTheme:
        TextSelectionThemeData(cursorColor: ColorSeed.primary.color),
    datePickerTheme: DatePickerThemeData(
      backgroundColor: ColorSeed.background.color,
      headerBackgroundColor: ColorSeed.primary.color,
      todayBorder: BorderSide(
        color: ColorSeed.primary.color,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle:
            const TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
        foregroundColor: ColorSeed.primary.color,
      ),
    ),
    dropdownMenuTheme:
        DropdownMenuThemeData(inputDecorationTheme: inputDecoration),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: ColorSeed.primary.color,
      extendedTextStyle: const TextStyle(color: Colors.white),
      foregroundColor: Colors.white,
    ),
  );

  static final darkTheme = ThemeData(
    primarySwatch: Colors.blueGrey,
    fontFamily: GoogleFonts.prompt(fontStyle: FontStyle.normal).fontFamily,
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
      backgroundColor:
          Colors.blueGrey, // Set AppBar background color for dark theme
    ),
    textTheme: const TextTheme(
      titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: colorToMaterialColor(
        Colors.blueGrey,
      ), // Set the desired color for CircularProgressIndicator here
    ),
  );
}
