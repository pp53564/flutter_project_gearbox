import 'package:flutter/material.dart';
import 'package:gearbox/common/presentation/widget/blog_info_row.dart';
import 'package:gearbox/core/style/style_extensions.dart';

class CardBlog extends StatelessWidget {
  final String subtitle;
  final String title;
  final String imageUrl;
  final DateTime dateTime;
  final int garageNumber;

  const CardBlog(
      {super.key,
      required this.subtitle,
      required this.title,
      required this.imageUrl,
      required this.dateTime,
      required this.garageNumber});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      color: context.colorBackground,
      elevation: 2,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(subtitle, style: context.textSmallThings),
                    const SizedBox(height: 8),
                    Text(title, style: context.textTitleCardList),
                    const SizedBox(height: 8),
                    BlogInfoRow(
                      garageNumber: garageNumber,
                      dateTime: dateTime,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 20),
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: 80,
                  maxWidth: 86,
                ),
                child: Image.asset(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
