import 'package:flutter/material.dart';
import 'package:gearbox/blogs/domain/entity/paginated_response.dart';
import 'package:gearbox/blogs/presentation/controller/state/blog_state.dart';
import 'package:gearbox/blogs/presentation/widget/error_state_widget.dart';
import 'package:gearbox/common/presentation/widget/card_blog.dart';
import 'package:gearbox/core/di.dart';
import 'package:gearbox/core/style/style_extensions.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class BlogListScreen extends StatefulHookConsumerWidget {
  const BlogListScreen({super.key});

  @override
  ConsumerState<StatefulHookConsumerWidget> createState() => _BlogListScreenState();
}

class _BlogListScreenState extends ConsumerState<BlogListScreen> {
  final PagingController<int, PaginatedResponse> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(blogLatestNotifierProvider.notifier).getLatestBlogs(0, 6);
    });
  }

  @override
  Widget build(BuildContext context) {
    final blogsLatestState = ref.watch(blogLatestNotifierProvider);

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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                switch (blogsLatestState) {
                  BlogStateFailure() => const ErrorStateWidget(),
                  BlogStateLoading() => CircularProgressIndicator(
                      color: context.colorPrimary,
                    ),
                  BlogStateSuccess(paginatedResponseLatest: final blogLatest) =>
                    // ListView.builder(
                    //             shrinkWrap: true,
                    //     physics: const NeverScrollableScrollPhysics(),
                    //     itemBuilder: (_, index) {
                    //       return CardBlog(
                    //         blog: blogLatest.content[index],
                    //       );
                    //     },
                    //     itemCount: blogLatest.content.length,
                    //   ),
                    PagedListView<int, PaginatedResponse>(
                      pagingController: _pagingController,
                      builderDelegate: PagedChildBuilderDelegate<PaginatedResponse>(
                        itemBuilder: (context, blog, index) => CardBlog(
                          blog: blog.content[index],
                        ),
                      ),
                    ),
                },
              ],
            ),
          ),
        ),
      ),
    );
  }
}
