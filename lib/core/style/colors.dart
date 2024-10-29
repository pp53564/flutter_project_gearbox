import 'package:flutter/material.dart';

const backgroundColorLight = Color(0XFFF2F2F2);
const primaryColorLight = Color(0XFF1E3C77);
const secondaryColorLight = Color(0XFFFFCC00);
const textColorLight = Color(0XFF212526);
const errorColorLight = Color(0XFFC02942);
const shadowColorLight = Color(0x26000000);
const whiteColor = Color(0xFFFFFFFF);
const placeholderColorLight = Color(0XFF898B8C);
const borderColorLight = Color(0XFF212526);
const bottomNavigationIconColorLight = Color(0xFF007AFF);
const paginationContainerColorLight = Color(0xFFBFBFBF);
const colorWithOpacityLight = Color.fromARGB(112, 191, 191, 191);
const colorBottomNavigationRowLight = Color(0x59DADADA);

class AppColors extends ThemeExtension<AppColors> {
  final Color? backgroundColor;
  final Color? textColor;
  final Color? primaryColor;
  final Color? secondaryColor;
  final Color? errorColor;
  final Color? placeholderColor;
  final Color? borderColor;
  final Color? bottomNavigationIconColor;
  final Color? paginationContainerColor;
  final Color? colorWithOpacity;
  final Color? colorBottomNavigationRow;

  const AppColors({
    required this.backgroundColor,
    required this.textColor,
    required this.primaryColor,
    required this.secondaryColor,
    required this.errorColor,
    required this.placeholderColor,
    required this.borderColor,
    required this.bottomNavigationIconColor,
    required this.paginationContainerColor,
    required this.colorWithOpacity,
    required this.colorBottomNavigationRow,
  });

  @override
  ThemeExtension<AppColors> copyWith({
    final Color? backgroundColor,
    final Color? textColor,
    final Color? primaryColor,
    final Color? secondaryColor,
    final Color? errorColor,
    final Color? placeholderColor,
    final Color? borderColor,
  }) =>
      AppColors(
        backgroundColor: backgroundColor ?? this.backgroundColor,
        textColor: textColor ?? this.textColor,
        primaryColor: primaryColor ?? this.primaryColor,
        secondaryColor: secondaryColor ?? this.secondaryColor,
        errorColor: errorColor ?? this.errorColor,
        placeholderColor: placeholderColor ?? this.placeholderColor,
        borderColor: borderColor ?? this.borderColor,
        bottomNavigationIconColor: bottomNavigationIconColor ?? this.bottomNavigationIconColor,
        paginationContainerColor: paginationContainerColor ?? this.paginationContainerColor,
        colorWithOpacity: colorWithOpacity ?? this.colorWithOpacity,
        colorBottomNavigationRow: colorBottomNavigationRow ?? this.colorBottomNavigationRow,
      );

  @override
  ThemeExtension<AppColors> lerp(covariant ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) {
      return this;
    }

    return AppColors(
        backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
        textColor: Color.lerp(textColor, other.textColor, t),
        primaryColor: Color.lerp(primaryColor, other.primaryColor, t),
        secondaryColor: Color.lerp(secondaryColor, other.secondaryColor, t),
        errorColor: Color.lerp(errorColor, other.errorColor, t),
        placeholderColor: Color.lerp(placeholderColor, other.placeholderColor, t),
        borderColor: Color.lerp(borderColor, other.borderColor, t),
        bottomNavigationIconColor:
            Color.lerp(bottomNavigationIconColor, other.bottomNavigationIconColor, t),
        paginationContainerColor:
            Color.lerp(paginationContainerColor, other.paginationContainerColor, t),
        colorWithOpacity: Color.lerp(colorWithOpacity, other.colorWithOpacity, t),
        colorBottomNavigationRow:
            Color.lerp(colorBottomNavigationRow, other.colorBottomNavigationRow, t));
  }
}
