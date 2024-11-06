import 'package:flutter/material.dart';
import 'package:gearbox/blogs/presentation/widget/bottom_sheet/blog_bottom_sheet_button.dart';
import 'package:gearbox/blogs/presentation/widget/comments/blog_comments.dart';
import 'package:gearbox/core/style/style_extensions.dart';

class BlogBottomSheetActions extends StatelessWidget {
  const BlogBottomSheetActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
      decoration: BoxDecoration(
        color: context.colorBackground,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -2),
            color: context.colorShadow,
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BlogBottomSheetButton(
            text: '3',
            icon: Icon(
              Icons.settings_outlined,
              color: context.colorPlaceholder,
            ),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: () => showModalBottomSheet(
              context: context,
              backgroundColor: context.colorBackground,
              builder: (_) => const BlogComments(),
            ),
            child: BlogBottomSheetButton(
              text: '3',
              icon: Icon(
                Icons.comment_outlined,
                color: context.colorPlaceholder,
              ),
            ),
          ),
          const Spacer(),
          BlogBottomSheetButton(
            icon: Icon(
              Icons.bookmark_border_outlined,
              color: context.colorPlaceholder,
            ),
          ),
        ],
      ),
    );
  }
}