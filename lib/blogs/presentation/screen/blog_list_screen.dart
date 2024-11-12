import 'package:flutter/material.dart';
import 'package:gearbox/blogs/domain/entity/blog.dart';
import 'package:gearbox/blogs/presentation/widget/loading/loading_blog_list_shimmer.dart';
import 'package:gearbox/common/presentation/widget/blog_card.dart';
import 'package:gearbox/common/presentation/widget/gearbox_appbar.dart';
import 'package:gearbox/core/di.dart';
import 'package:gearbox/core/localization_extension.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:riverpod_infinite_scroll/riverpod_infinite_scroll.dart';

class BlogListScreen extends StatelessWidget {
  const BlogListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GearboxAppbar(title: context.blogs),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                RiverPagedBuilder<int, Blog>(
                  pullToRefresh: true,
                  firstPageKey: 0,
                  limit: 6,
                  provider: blogListPaginationNotifierProvider,
                  itemBuilder: (context, blog, index) => BlogCard(blog: blog),
                  firstPageProgressIndicatorBuilder: (context, controller) =>
                      const LoadingBlogListShimmer(),
                  newPageProgressIndicatorBuilder: (context, controller) => const Center(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  pagedBuilder: (controller, builder) => PagedListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    pagingController: controller,
                    builderDelegate: builder,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
