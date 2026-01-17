import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gearbox/blogs/presentation/controller/state/like_state.dart';
import 'package:gearbox/blogs/presentation/widget/bottom_sheet/blog_bottom_sheet_button.dart';
import 'package:gearbox/blogs/presentation/widget/comments/blog_comments.dart';
import 'package:gearbox/core/di.dart';
import 'package:gearbox/core/style/style_extensions.dart';

class BlogBottomSheetActions extends ConsumerWidget {
  final String blogId;

  const BlogBottomSheetActions({super.key, required this.blogId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final likeState = ref.watch(likeNotifierProvider);

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
          // likeState.when(
          //   data: (isLiked) => BlogBottomSheetButton(
          //     icon: Icon(
          //       isLiked ? Icons.bookmark : Icons.bookmark_border_outlined,
          //       color: context.colorPlaceholder,
          //     ),
          //     onPressed: () {
          //       handleLike(context, ref, blogId);
          //     },
          //   ),
          //   loading: () => const CircularProgressIndicator(),
          //   error: (error, stack) => IconButton(
          //     icon: const Icon(Icons.error_outline),
          //     color: Colors.red,
          //     onPressed: () {
          //       handleLike(context, ref, blogId);
          //     },
          //   ),
          // ),
          switch (likeState) {
            LikeStateSuccess() => BlogBottomSheetButton(
                icon: Icon(
                  likeState.isLiked ? Icons.bookmark : Icons.bookmark_border_outlined,
                  color: context.colorPlaceholder,
                ),
                onPressed: () {
                  handleLike(context, ref, blogId);
                },
              ),
            LikeStateFailure() => IconButton(
                icon: const Icon(Icons.error_outline),
                color: Colors.red,
                onPressed: () {
                  handleLike(context, ref, blogId);
                },
              ),
            LikeStateLoading() => const CircularProgressIndicator(),
          }
        ],
      ),
    );
  }
}

Future<void> handleLike(BuildContext context, WidgetRef ref, String blogId) async {
  final likeNotifier = ref.read(likeNotifierProvider.notifier);
  final secureStorage = ref.read(secureStorageProvider);
  final userId = await secureStorage.read(key: 'KEY_USER_ID');
  if (userId != null) await likeNotifier.toggleLike(blogId, userId);
}
