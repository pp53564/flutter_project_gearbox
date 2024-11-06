import 'package:flutter/material.dart';
import 'package:gearbox/core/style/colors.dart';
import 'package:gearbox/core/style/style_extensions.dart';
import 'package:gearbox/core/utils/utils_date.dart';

class BlogInfoRow extends StatelessWidget {
  final DateTime dateTime;
  final int numberOfLikes;

  const BlogInfoRow({super.key, required this.dateTime, required this.numberOfLikes});

  @override
  Widget build(BuildContext context) {
    String timeToShow = UtilsDate.getTime(dateTime, context);

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
              const SizedBox(width: 10),
            ],
          ),
        const Icon(
          Icons.settings_outlined,
          color: placeholderColorLight,
          size: 16,
        ),
        const SizedBox(width: 2),
        Text(numberOfLikes.toString(), style: context.textSmallThings),
      ],
    );
  }
}
