import 'package:flutter/material.dart';
import 'package:gearbox/blogs/domain/entity/blog.dart';
import 'package:gearbox/blogs/presentation/widget/avatar_row.dart';
import 'package:gearbox/blogs/presentation/widget/bottom_sheet/blog_bottom_sheet_actions.dart';
import 'package:gearbox/common/presentation/widget/blog_info_row.dart';
import 'package:gearbox/common/presentation/widget/gearbox_appbar.dart';
import 'package:gearbox/core/style/style_extensions.dart';

class BlogDetailsScreen extends StatelessWidget {
  const BlogDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final blog = ModalRoute.of(context)!.settings.arguments as Blog;

    return Scaffold(
      appBar: const GearboxAppbar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AvatarRow(
                  username: '@brunobenner',
                  avatarUrl: 'assets/images/avatar.png',
                ),
                const SizedBox(height: 20),
                Text(
                  blog.title,
                  textAlign: TextAlign.start,
                  style: context.textTitle,
                ),
                const SizedBox(height: 10),
                Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width,
                    maxHeight: 200,
                  ),
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image(
                      image: NetworkImage(blog.thumbnailImageUrl),
                      // width: 330,
                      // height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                BlogInfoRow(
                  dateTime: blog.createDate,
                  category: blog.category.name,
                ),
                const SizedBox(height: 20),
                Text(
                  blog.content,
                  style: context.textDescription,
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 70),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: BlogBottomSheetActions(blogId: blog.id),
    );
  }
}
