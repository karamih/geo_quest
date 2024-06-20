import 'package:flutter/material.dart';

class MyTheme {
  static const Color primaryColor = Color(0xffF6995C);
  static const Color secondaryColor = Color(0xff51829B);
  static const Color tertiary = Color(0xff9BB0C1);
  static const Color surfaceColor = Color(0xffEADFB4);

  static const ColorScheme lightTheme = ColorScheme.light(
    surface: surfaceColor,
    primary: primaryColor,
    secondary: secondaryColor,
    tertiary: tertiary,
  );
}
