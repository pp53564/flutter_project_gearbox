import 'package:flutter/material.dart';
import 'package:gearbox/common/presentation/widget/blog_info_row.dart';
import 'package:gearbox/core/route_generator.dart';
import 'package:gearbox/core/style/style_extensions.dart';

class BlogCard extends StatelessWidget {
  final String type;
  final String title;
  final String imageUrl;
  final DateTime dateTime;
  final int numOfLikes;

  const BlogCard({
    super.key,
    required this.type,
    required this.title,
    required this.imageUrl,
    required this.dateTime,
    required this.numOfLikes,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _redirectToDetailsScreen(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        color: context.colorBackground,
        elevation: 2,
        shadowColor: const Color(0x59DADADA),
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(type, style: context.textSmallThings),
                    const SizedBox(height: 8),
                    Text(title, style: context.textTitleCardList),
                    const SizedBox(height: 8),
                    BlogInfoRow(
                      numOfLikes: numOfLikes,
                      dateTime: dateTime,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 20),
              ConstrainedBox(
                constraints: const BoxConstraints(
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

  void _redirectToDetailsScreen(final BuildContext context) =>
      Navigator.of(context).pushNamed(RouteGenerator.blogDetailsScreen);
}
