import 'package:flutter/material.dart';
import 'package:gearbox/core/style/colors.dart';
import 'package:gearbox/core/style/text_styles.dart';

extension StyleExtension on BuildContext {
  Color get colorBackground =>
      Theme.of(this).extension<AppColors>()!.backgroundColor!;

  Color get colorPrimary =>
      Theme.of(this).extension<AppColors>()!.primaryColor!;

  Color get colorSecondary =>
      Theme.of(this).extension<AppColors>()!.secondaryColor!;

  Color get colorShadow => Theme.of(this).shadowColor;

  Color get colorText => Theme.of(this).extension<AppColors>()!.textColor!;

  Color get colorError => Theme.of(this).extension<AppColors>()!.errorColor!;

  Color get colorBorder => Theme.of(this).extension<AppColors>()!.borderColor!;

  TextStyle get textTitle => Theme.of(this).textTheme.title;

  TextStyle get textStandard => Theme.of(this).textTheme.standard;

  TextStyle get textDescription => Theme.of(this).textTheme.description;

  TextStyle get textDescriptionAuth => Theme.of(this).textTheme.descriptionAuth;

  TextStyle get textError => Theme.of(this).textTheme.error;

  TextStyle get textPlaceholder => Theme.of(this).textTheme.placeholder;

  TextStyle get textButton => Theme.of(this).textTheme.buttonText;

  TextStyle get textLink => Theme.of(this).textTheme.linkText;
}
