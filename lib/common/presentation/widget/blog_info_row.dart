import 'package:flutter/material.dart';
import 'package:gearbox/core/localization_extension.dart';
import 'package:gearbox/core/style/colors.dart';
import 'package:gearbox/core/style/style_extensions.dart';

class BlogInfoRow extends StatelessWidget {
  final DateTime dateTime;
  final int garageNumber;

  const BlogInfoRow({super.key, required this.dateTime, required this.garageNumber});

  @override
  Widget build(BuildContext context) {
    Duration difference = DateTime.now().difference(dateTime);
    String timeToShow = "";

    if (difference.inSeconds < 60) {
      timeToShow = context.dateDiffFewSeconds;
    } else if (difference.inMinutes < 60) {
      if (difference.inMinutes == 1) {
        timeToShow = context.dateDiffMinute;
      } else {
        timeToShow = context.dateDiffMinutes(difference.inMinutes);
      }
    } else if (difference.inHours < 24) {
      if (difference.inHours == 1) {
        timeToShow = context.dateDiffHour;
      } else {
        timeToShow = context.dateDiffHours(difference.inHours);
      }
    } else if (difference.inDays < 7) {
      if (difference.inDays == 1) {
        timeToShow = context.dateDiffDay;
      } else {
        timeToShow = context.dateDiffDays(difference.inDays);
      }
    } else if (difference.inDays < 30) {
      int weeks = (difference.inDays / 7).floor();
      if (weeks == 1) {
        timeToShow = context.dateDiffWeek;
      } else {
        timeToShow = context.dateDiffWeeks((difference.inDays / 7.0).floor());
      }
    } else if (difference.inDays < 365) {
      int months = (difference.inDays / 30).floor();
      if (months == 1) {
        timeToShow = context.dateDiffMonth;
      } else {
        int months = (difference.inDays / 30).floor();
        timeToShow = context.dateDiffMonths(months);
      }
    } else {
      int years = (difference.inDays / 365).floor();
      if (years == 1) {
        timeToShow = context.dateDiffYear;
      } else {
        timeToShow = context.dateDiffYears((difference.inDays / 365).floor());
      }
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (timeToShow != "")
          Row(
            children: [
              const Icon(
                Icons.access_time_outlined,
                color: placeholderColorLight,
                size: 16,
              ),
              const SizedBox(width: 2),
              Text(timeToShow, style: context.textSmallThings),
              const SizedBox(width: 22),
            ],
          ),
        const Icon(
          Icons.settings_outlined,
          color: placeholderColorLight,
          size: 16,
        ),
        const SizedBox(width: 2),
        Text(garageNumber.toString(), style: context.textSmallThings),
      ],
    );
  }
}
