import 'package:flutter/material.dart';
import 'package:gearbox/blogs/presentation/widget/loading/loading_card.dart';

class LoadingBlogListShimmer extends StatelessWidget {
  const LoadingBlogListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(6, (index) {
          return const LoadingCard();
        }),
      ),
    );
  }
}
