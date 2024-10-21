import 'package:flutter/material.dart';

import 'colors.dart';

const _fontSFProRounded = 'SF Pro Rounded';

const _titleTextStyle = TextStyle(fontSize: 28, fontWeight: FontWeight.w700);
const _standardTextStyle = TextStyle(fontSize: 14, fontWeight: FontWeight.w600);
const _descriptionTextStyle =
    TextStyle(fontSize: 14, fontWeight: FontWeight.w400);
const _descriptionAuthTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontFamily: _fontSFProRounded,
    color: Colors.black);
const _placeholderTextStyle = TextStyle(
    fontSize: 16, fontWeight: FontWeight.w400, color: placeholderColorLight);
const _errorTextStyle = TextStyle(fontSize: 12, fontWeight: FontWeight.w400);

const _buttonTextStyle =
    TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: whiteColor);

const _linkTextStyle = TextStyle(
    fontSize: 16, fontWeight: FontWeight.bold, color: primaryColorLight);

extension CustomTextStyle on TextTheme {
  TextStyle get title => _titleTextStyle;

  TextStyle get standard => _standardTextStyle;

  TextStyle get description => _descriptionTextStyle;

  TextStyle get descriptionAuth => _descriptionAuthTextStyle;

  TextStyle get placeholder => _placeholderTextStyle;

  TextStyle get error => _errorTextStyle;

  TextStyle get buttonText => _buttonTextStyle;

  TextStyle get linkText => _linkTextStyle;
}
