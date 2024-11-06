import 'package:flutter/material.dart';
import 'package:gearbox/core/localization_extension.dart';
import 'package:gearbox/core/string_extension.dart';
import 'package:intl/intl.dart';

class UtilsDate {
  static String getFormattedDay(final Locale locale, final DateTime dateTime) {
    final String formattedDateWithoutDay =DateFormat('EEEE, MMMM', locale.toString()).format(dateTime);
    final int day = int.parse(DateFormat('d').format(dateTime));
    final String suffix = getSuffix(day);
    return locale.toString() == 'en'
        ? '$formattedDateWithoutDay $day$suffix'
        : '$formattedDateWithoutDay $day'.toCapitalized;
  }

  static String getTime(final DateTime dateTime, final BuildContext context) {
    final difference = DateTime.now().difference(dateTime);
    final int seconds = difference.inSeconds;
    final int minutes = difference.inMinutes;
    final int hours = difference.inHours;
    final int days = difference.inDays;
    final int weeks = (days / 7).floor();
    final int months = (days / 30).floor();
    final int years = (days / 365).floor();

    String pluralize(int value, String singular, Function plural) {
      return value == 1 ? singular : plural(value);
    }

    if (seconds < 60) return context.dateDiffFewSeconds;

    if (minutes < 60) {
      return pluralize(minutes, context.dateDiffMinute, context.dateDiffMinutes);
    }

    if (hours < 24) {
      return pluralize(hours, context.dateDiffHour, context.dateDiffHours);
    }

    if (days < 7) {
      return pluralize(days, context.dateDiffDay, context.dateDiffDays);
    }

    if (days < 30) {
      return pluralize(weeks, context.dateDiffWeek, context.dateDiffWeeks);
    }

    if (days < 365) {
      return pluralize(months, context.dateDiffMonth, context.dateDiffMonths);
    }

    return pluralize(years, context.dateDiffYear, context.dateDiffYears);
  }
}

String getSuffix(int day) {
  switch (day) {
    case 1:
    case 21:
    case 31:
      return 'st';
    case 2:
    case 22:
      return 'nd';
    case 3:
    case 23:
      return 'rd';
    default:
      return 'th';
  }
}
