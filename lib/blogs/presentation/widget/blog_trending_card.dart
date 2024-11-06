import 'package:flutter/material.dart';
import 'package:gearbox/common/presentation/widget/blog_info_row.dart';
import 'package:gearbox/core/localization_extension.dart';
import 'package:gearbox/core/style/style_extensions.dart';

class BlogTrendingCard extends StatelessWidget {
  final String textUrl;
  final DateTime dateTime;
  final int numOfLikes;
  final String title;
  final String subtitle;

  const BlogTrendingCard({
    super.key,
    required this.textUrl,
    required this.dateTime,
    required this.numOfLikes,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: screenSize.width - 40),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        color: context.colorBackground,
        elevation: 2,
        shadowColor: const Color(0x59DADADA),
        child: Container(
          alignment: Alignment.topCenter,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.asset(textUrl, fit: BoxFit.cover),
                  Positioned(
                    top: 10,
                    left: 10,
                    child: Container(
                      decoration: BoxDecoration(
                        color: context.colorPrimary,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                        child: Text(
                          context.trending,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Text(
                title,
                style: context.textTitleCard,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(subtitle, style: context.textSmallThings),
                  BlogInfoRow(
                    dateTime: dateTime,
                    numOfLikes: numOfLikes,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
