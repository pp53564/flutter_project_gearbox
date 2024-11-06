import 'package:flutter/material.dart';
import 'package:gearbox/blogs/domain/entity/blog.dart';
import 'package:gearbox/blogs/presentation/controller/blog_list_pagination_notifier.dart';
import 'package:gearbox/blogs/presentation/widget/loading/loading_blog_list_shimmer.dart';
import 'package:gearbox/common/presentation/widget/blog_card.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:riverpod_infinite_scroll/riverpod_infinite_scroll.dart';

class BlogListScreen extends StatelessWidget {
  const BlogListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(50.0),
      //   child: AppBar(
      //     backgroundColor: context.colorBackground,
      //     leading: const Padding(
      //       padding: EdgeInsets.all(10),
      //       child: BackButtonCustom(),
      //     ),
      //   ),
      // ),
      body: RiverPagedBuilder<int, Blog>(
        pullToRefresh: true,
        firstPageKey: 0,
        limit: 6,
        provider: blogListPaginationProvider,
        itemBuilder: (context, blog, index) => BlogCard(blog: blog),
        firstPageProgressIndicatorBuilder: (context, controller) => const LoadingBlogListShimmer(),
        newPageProgressIndicatorBuilder: (context, controller) => const CircularProgressIndicator(),
        pagedBuilder: (controller, builder) => PagedListView(
          pagingController: controller,
          builderDelegate: builder,
        ),
      ),
    );
  }
}
