import 'package:flutter/material.dart';
import 'package:gearbox/blogs/domain/entity/blog.dart';
import 'package:gearbox/common/presentation/widget/blog_info_row.dart';
import 'package:gearbox/core/localization_extension.dart';
import 'package:gearbox/core/style/style_extensions.dart';

class CardBlogTrending extends StatelessWidget {
  final Blog blog;

  const CardBlogTrending({
    super.key,
    required this.blog,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 350,
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        color: context.colorBackground,
        elevation: 2,
        child: Container(
          alignment: Alignment.topCenter,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image(
                      image: NetworkImage(blog.thumbnailImageUrl),
                      width: 330,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
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
                blog.title,
                style: context.textTitleCard,
                overflow: TextOverflow.ellipsis,
              ),
              // const SizedBox(height: 20),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(blog.category.formattedEnum, style: context.textSmallThings),
                  BlogInfoRow(
                    dateTime: blog.createDate,
                    numberOfLikes: blog.numberOfLikes,
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
