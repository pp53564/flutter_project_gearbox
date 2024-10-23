import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension LocalizationExtension on BuildContext {
  String get signIn => AppLocalizations.of(this)!.signIn;

  String get signUp => AppLocalizations.of(this)!.signUp;

  String get emailHint => AppLocalizations.of(this)!.emailHint;

  String get passwordHint => AppLocalizations.of(this)!.passwordHint;

  String get emailEmpty => AppLocalizations.of(this)!.emailEmpty;

  String get passwordEmpty => AppLocalizations.of(this)!.passwordEmpty;

  String get signInTitle => AppLocalizations.of(this)!.signInTitle;

  String get signUpTitle => AppLocalizations.of(this)!.signUpTitle;

  String get signInSubTitle => AppLocalizations.of(this)!.signInSubTitle;

  String get signUpSubTitle => AppLocalizations.of(this)!.signUpSubTitle;

  String get emailValidation => AppLocalizations.of(this)!.emailValidation;

  String get passwordMinLength => AppLocalizations.of(this)!.passwordMinLength;

  String get dontHaveAccount => AppLocalizations.of(this)!.dontHaveAccount;

  String get alreadyHaveAccount => AppLocalizations.of(this)!.alreadyHaveAccount;

  String get usernameHint => AppLocalizations.of(this)!.usernameHint;

  String get usernameEmpty => AppLocalizations.of(this)!.usernameEmpty;

  String get passwordConfirmHint => AppLocalizations.of(this)!.passwordConfirmHint;

  String get forgotPassword => AppLocalizations.of(this)!.forgotPassword;

  String get blogs => AppLocalizations.of(this)!.blogs;

  String get explore => AppLocalizations.of(this)!.explore;

  String get newBottomNavigation => AppLocalizations.of(this)!.newBottomNavigation;

  String get saved => AppLocalizations.of(this)!.saved;

  String get garage => AppLocalizations.of(this)!.garage;
}
