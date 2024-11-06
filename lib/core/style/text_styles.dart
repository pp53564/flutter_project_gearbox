import 'package:flutter/material.dart';

import 'colors.dart';

const _titleTextStyle = TextStyle(fontSize: 28, fontWeight: FontWeight.w700);
const _titleCardTextStyle = TextStyle(fontSize: 22, fontWeight: FontWeight.w700);
const _titleCardListTextStyle = TextStyle(fontSize: 14, fontWeight: FontWeight.w700);
const _titleBlogCardTextStyle = TextStyle(fontSize: 19, fontWeight: FontWeight.w700);
const _standardTextStyle = TextStyle(fontSize: 14, fontWeight: FontWeight.w600);
const _descriptionTextStyle = TextStyle(fontSize: 14);
const _descriptionAuthTextStyle =
    TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black);
const _placeholderTextStyle =
    TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: placeholderColorLight);
const _errorTextStyle = TextStyle(fontSize: 12, fontWeight: FontWeight.w400);

const _buttonTextStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: whiteColor);

const _linkTextStyle =
    TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: primaryColorLight);
const _linkThinTextStyle =
    TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: primaryColorLight);
const _smallThingsTextStyle =
    TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: placeholderColorLight);

const _commentTextStyle = TextStyle(fontSize: 14, height: 1.2);

extension CustomTextStyle on TextTheme {
  TextStyle get title => _titleTextStyle;

  TextStyle get standard => _standardTextStyle;

  TextStyle get description => _descriptionTextStyle;

  TextStyle get descriptionAuth => _descriptionAuthTextStyle;

  TextStyle get placeholder => _placeholderTextStyle;

  TextStyle get error => _errorTextStyle;

  TextStyle get buttonText => _buttonTextStyle;

  TextStyle get linkText => _linkTextStyle;

  TextStyle get titleCardText => _titleCardTextStyle;

  TextStyle get smallThingsText => _smallThingsTextStyle;

  TextStyle get titleBlogCardText => _titleBlogCardTextStyle;

  TextStyle get linkThinText => _linkThinTextStyle;

  TextStyle get titleCardListText => _titleCardListTextStyle;
  
  TextStyle get commentText => _commentTextStyle;
}
