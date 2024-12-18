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

  String get userAlreadyExists => AppLocalizations.of(this)!.userAlreadyExists;

  String get userIsNotFound => AppLocalizations.of(this)!.userIsNotFound;

  String get passwordsMustMatch => AppLocalizations.of(this)!.passwordsMustMatch;

  String get latest => AppLocalizations.of(this)!.latest;

  String get trending => AppLocalizations.of(this)!.trending;

  String get back => AppLocalizations.of(this)!.back;

  String get comments => AppLocalizations.of(this)!.comments;

  String get commentPlaceholder => AppLocalizations.of(this)!.comment_placeholder;

  String get notifications => AppLocalizations.of(this)!.notifications;

  String get viewMore => AppLocalizations.of(this)!.viewMore;

  String get chooseLanguage => AppLocalizations.of(this)!.chooseLanguage;

  String get dateDiffFewSeconds => AppLocalizations.of(this)!.dateDiffFewSeconds;

  String get dateDiffMinute => AppLocalizations.of(this)!.dateDiffMinute;

  String dateDiffMinutes(int diff) => AppLocalizations.of(this)!.dateDiffMinutes(diff);

  String get dateDiffHour => AppLocalizations.of(this)!.dateDiffHour;

  String dateDiffHours(int diff) => AppLocalizations.of(this)!.dateDiffHour;

  String get dateDiffDay => AppLocalizations.of(this)!.dateDiffDay;

  String dateDiffDays(int diff) => AppLocalizations.of(this)!.dateDiffDays(diff);

  String get dateDiffWeek => AppLocalizations.of(this)!.dateDiffWeek;

  String dateDiffWeeks(int diff) => AppLocalizations.of(this)!.dateDiffWeeks(diff);

  String get dateDiffMonth => AppLocalizations.of(this)!.dateDiffMonth;

  String dateDiffMonths(int diff) => AppLocalizations.of(this)!.dateDiffMonths(diff);

  String get dateDiffYear => AppLocalizations.of(this)!.dateDiffYear;

  String dateDiffYears(int diff) => AppLocalizations.of(this)!.dateDiffYears(diff);
}
