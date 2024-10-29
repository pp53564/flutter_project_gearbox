import 'package:flutter/material.dart';
import 'package:gearbox/blogs/presentation/widget/bottom_container.dart';
import 'package:gearbox/blogs/presentation/widget/bottom_sheet_comments.dart';
import 'package:gearbox/core/style/style_extensions.dart';

class BottomSheetWithButtons extends StatelessWidget {
  const BottomSheetWithButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BottomContainer(
                text: '3',
                icon: Icon(
                  Icons.settings_outlined,
                  color: context.colorPlaceholder,
                ),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: context.colorBackground,
                    builder: (context) => const BottomSheetComments(),
                  );
                },
                child: BottomContainer(
                  text: '3',
                  icon: Icon(
                    Icons.comment_outlined,
                    color: context.colorPlaceholder,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 30),
          BottomContainer(
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
