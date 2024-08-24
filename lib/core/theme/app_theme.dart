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
  focusColor: KpColorSeed.instance.primary,
  filled: true,
  isDense: true,
  labelStyle: const TextStyle(color: Colors.black87, fontSize: 14),
  hintStyle: const TextStyle(color: Colors.black87, fontSize: 14),
  fillColor: KpColorSeed.instance.background,
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
    iconTheme: const IconThemeData(
      color: Colors.white,
      size: 16,
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.all(KpColorSeed.instance.primary),
    ),
    primaryColor: KpColorSeed.instance.primary,
    primarySwatch: colorToMaterialColor(KpColorSeed.instance.primary),
    fontFamily: GoogleFonts.prompt(fontStyle: FontStyle.normal).fontFamily,
    brightness: Brightness.light,
    appBarTheme: AppAppbar.appbar,
    scaffoldBackgroundColor: KpColorSeed.instance.background,
    buttonTheme: ButtonThemeData(
      buttonColor: KpColorSeed.instance.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: KpColorSeed.instance.primary),
      ),
      textTheme: ButtonTextTheme.primary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: KpColorSeed.instance.primary,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        disabledBackgroundColor: Colors.grey,
        disabledForegroundColor: Colors.black,
      ),
    ),
    textTheme: TextTheme(
      titleMedium: TextStyle(
        fontSize: 16,
        color: KpColorSeed.instance.front,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        color: KpColorSeed.instance.front,
      ),
      titleSmall: TextStyle(
        fontSize: 14,
        color: KpColorSeed.instance.front,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        color: KpColorSeed.instance.front,
      ),
      bodyLarge: TextStyle(
        fontSize: 18,
        color: KpColorSeed.instance.front,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        color: KpColorSeed.instance.front,
      ),
      displayLarge: TextStyle(
        fontSize: 34,
        color: KpColorSeed.instance.front,
      ),
      displayMedium: TextStyle(
        fontSize: 28,
        color: KpColorSeed.instance.front,
      ),
      displaySmall: TextStyle(
        fontSize: 24,
        color: KpColorSeed.instance.front,
      ),
      headlineLarge: TextStyle(
        fontSize: 22,
        color: KpColorSeed.instance.front,
      ),
      headlineMedium: TextStyle(
        fontSize: 20,
        color: KpColorSeed.instance.front,
      ),
      headlineSmall: TextStyle(
        fontSize: 18,
        color: KpColorSeed.instance.front,
      ),
      labelLarge: TextStyle(
        fontSize: 16,
        color: KpColorSeed.instance.front,
      ),
      labelMedium: TextStyle(
        fontSize: 14,
        color: KpColorSeed.instance.front,
      ),
      labelSmall: TextStyle(
        fontSize: 12,
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
        textStyle:
            const TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
        foregroundColor: KpColorSeed.instance.primary,
      ),
    ),
    dropdownMenuTheme:
        DropdownMenuThemeData(inputDecorationTheme: inputDecoration),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: KpColorSeed.instance.primary,
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
