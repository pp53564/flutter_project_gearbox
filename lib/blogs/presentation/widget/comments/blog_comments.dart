import 'package:flutter/material.dart';
import 'package:gearbox/blogs/presentation/widget/avatar_row.dart';
import 'package:gearbox/blogs/presentation/widget/comments/button_comment.dart';
import 'package:gearbox/blogs/presentation/widget/comments/comment_input.dart';
import 'package:gearbox/common/presentation/widget/button/gearbox_close_button.dart';
import 'package:gearbox/core/localization_extension.dart';
import 'package:gearbox/core/style/style_extensions.dart';

class BlogComments extends StatelessWidget {
  const BlogComments({super.key});

  @override
  Widget build(BuildContext context) {
    const comments = [
      AvatarRow(
        avatarUrl: 'assets/images/profile_picture2.png',
        username: '@hansmuliner',
        comment: 'I can’t wait to see this next generation Apple Car Play in my Jaguar',
      ),
      AvatarRow(
        avatarUrl: 'assets/images/profile_picture3.png',
        username: '@tomtainor',
        comment:
            'Honestly, I think this will be a huge feature for iPhone users. This has a potential to create your own car gauges and customize your dasboard to your liking. I hope that users will have that opportunity in the next gen.',
      ),
      AvatarRow(
          avatarUrl: 'assets/images/profile_picture4.png',
          username: '@theresawalter',
          comment: 'I just hope that the dashboard won’t be locked by brand.'),
    ];

    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom + 20),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 550),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(context.comments, style: context.textCardBlogTitle),
                  const GearboxCloseButton(),
                ],
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (_, index) => comments[index],
                  separatorBuilder: (_, __) => const SizedBox(height: 10),
                  itemCount: comments.length,
                  physics: const ClampingScrollPhysics(),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 15,
                      backgroundImage: AssetImage('assets/images/profile_picture.png'),
                    ),
                    SizedBox(width: 10),
                    Expanded(child: CommentInput()),
                    SizedBox(width: 10),
                    ButtonComment(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
