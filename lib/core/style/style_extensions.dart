import 'package:flutter/material.dart';
import 'package:gearbox/core/style/colors.dart';
import 'package:gearbox/core/style/text_styles.dart';

extension StyleExtension on BuildContext {
  Color get colorBackground => Theme.of(this).extension<AppColors>()!.backgroundColor!;

  Color get colorPrimary => Theme.of(this).extension<AppColors>()!.primaryColor!;

  Color get colorSecondary => Theme.of(this).extension<AppColors>()!.secondaryColor!;

  Color get colorShadow => Theme.of(this).shadowColor;

  Color get colorText => Theme.of(this).extension<AppColors>()!.textColor!;

  Color get colorError => Theme.of(this).extension<AppColors>()!.errorColor!;

  Color get colorBorder => Theme.of(this).extension<AppColors>()!.borderColor!;

  Color get colorBottomNavigationIcon =>
      Theme.of(this).extension<AppColors>()!.bottomNavigationIconColor!;

  Color get colorPaginationContainer =>
      Theme.of(this).extension<AppColors>()!.paginationContainerColor!;

  Color get colorPlaceholder => Theme.of(this).extension<AppColors>()!.placeholderColor!;

  Color get colorBottomNavigationRow => Theme.of(this).extension<AppColors>()!.bottomNavigationRow!;

  Color get colorPageIndicatorBackground =>
      Theme.of(this).extension<AppColors>()!.pageIndicatorBackground!;

  TextStyle get textTitle => Theme.of(this).textTheme.title;

  TextStyle get textStandard => Theme.of(this).textTheme.standard;

  TextStyle get textDescription => Theme.of(this).textTheme.description;

  TextStyle get textDescriptionAuth => Theme.of(this).textTheme.descriptionAuth;

  TextStyle get textError => Theme.of(this).textTheme.error;

  TextStyle get textPlaceholder => Theme.of(this).textTheme.placeholder;

  TextStyle get textButton => Theme.of(this).textTheme.buttonText;

  TextStyle get textLink => Theme.of(this).textTheme.linkText;

  TextStyle get textTitleCard => Theme.of(this).textTheme.titleCardText;

  TextStyle get textSmallThings => Theme.of(this).textTheme.smallThingsText;

  TextStyle get textCardBlogTitle => Theme.of(this).textTheme.titleBlogCardText;

  TextStyle get textLinkThin => Theme.of(this).textTheme.linkThinText;

  TextStyle get textTitleCardList => Theme.of(this).textTheme.titleCardListText;

  TextStyle get textComment => Theme.of(this).textTheme.commentText;

  TextStyle get textSmallTitle => Theme.of(this).textTheme.smallTitle;
}
