import 'package:flutter/material.dart';
import 'package:gearbox/core/localization_extension.dart';
import 'package:gearbox/core/style/style_extensions.dart';
import 'package:gearbox/core/utils/utils_date.dart';

class BlogInfoRow extends StatelessWidget {
  final DateTime dateTime;
  final int? numOfLikes;
  final String? category;

  const BlogInfoRow({
    super.key,
    required this.dateTime,
    this.numOfLikes,
    this.category,
  });

  @override
  Widget build(BuildContext context) {
    String timeToShow = UtilsDate.getTime(dateTime, context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (timeToShow != "")
          Row(
            children: [
              Icon(
                Icons.access_time_outlined,
                color: context.colorPlaceholder,
                size: 16,
              ),
              const SizedBox(width: 2),
              Text(timeToShow, style: context.textSmallThings),
              const SizedBox(width: 10),
            ],
          ),
        if (numOfLikes != null)
          Row(
            children: [
              Icon(
                Icons.settings_outlined,
                color: context.colorPlaceholder,
                size: 16,
              ),
              const SizedBox(width: 2),
              Text(numOfLikes.toString(), style: context.textSmallThings),
            ],
          ),
        if (category != null)
          Row(children: [
            const SizedBox(width: 10),
            Text(context.categoryType(category!), style: context.textSmallThings),
          ])
      ],
    );
  }
}
