import 'package:flutter/material.dart';
import 'package:gearbox/blogs/domain/entity/blog.dart';
import 'package:gearbox/common/presentation/widget/blog_info_row.dart';
import 'package:gearbox/core/localization_extension.dart';
import 'package:gearbox/core/route_generator.dart';
import 'package:gearbox/core/style/style_extensions.dart';

class BlogCard extends StatelessWidget {
  final Blog blog;

  const BlogCard({super.key, required this.blog});

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
          //nisam sigurna za ovaj height jel treba
          height: 130,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(context.categoryType(blog.category.name), style: context.textSmallThings),
                    const SizedBox(height: 8),
                    Text(
                      blog.title,
                      style: context.textTitleCardList,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                    // const SizedBox(height: 8),
                    const Spacer(),
                    BlogInfoRow(
                      numOfLikes: blog.numberOfLikes,
                      dateTime: blog.createDate,
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image(
                      image: NetworkImage(blog.thumbnailImageUrl),
                      width: 120,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
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
