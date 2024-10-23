import 'package:flutter/material.dart';
import 'package:gearbox/core/string_extension.dart';
import 'package:intl/intl.dart';

class UtilsDate {
  static String getFormattedDay(final Locale locale, final DateTime dateTime) {
    String formattedDateWithoutDay = DateFormat('EEEE, MMMM', locale.toString()).format(dateTime);
    int day = int.parse(DateFormat('d').format(dateTime));
    String suffix = getSuffix(day);
    return locale.toString() == 'en'
        ? '$formattedDateWithoutDay $day$suffix'
        : '$formattedDateWithoutDay $day'.toCapitalized;
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
