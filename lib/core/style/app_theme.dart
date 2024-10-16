import 'package:flutter/material.dart';
import 'package:gearbox/core/style/colors.dart';

class AppTheme {
  const AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    fontFamily: 'SF Pro Rounded',
    useMaterial3: true,
    scaffoldBackgroundColor: backgroundColorLight,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(backgroundColor: backgroundColorLight),
    shadowColor: shadowColorLight,
    extensions: const [AppColors(
        backgroundColor: backgroundColorLight,
        textColor: textColorLight,
        primaryColor: primaryColorLight,
        secondaryColor: secondaryColorLight,
        errorColor: errorColorLight
    )]
  );
}