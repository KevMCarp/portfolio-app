import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

class AppTheme {
  static ThemeData lightThemeData = ThemeData.from(
    colorScheme: colorScheme(Brightness.light),
    textTheme: GoogleFonts.quicksandTextTheme(),
  );

  static ThemeData darkThemeData = ThemeData.from(
    colorScheme: colorScheme(Brightness.dark),
    textTheme: GoogleFonts.quicksandTextTheme(
      ThemeData.dark().textTheme,
    ),
  );

  static ColorScheme colorScheme(Brightness brightness) {
    return ColorScheme.fromSeed(
      seedColor: kPrimaryColor,
      brightness: brightness,
    );
  }

  // static const _regular = FontWeight.w400;
  // static const _medium = FontWeight.w500;
  // static const _semiBold = FontWeight.w600;
  // static const _bold = FontWeight.w700;

}
