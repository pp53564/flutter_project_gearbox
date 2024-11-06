import 'package:flutter/material.dart';
import 'package:gearbox/blogs/presentation/controller/state/blog_state.dart';
import 'package:gearbox/blogs/presentation/widget/card_blog_trending.dart';
import 'package:gearbox/blogs/presentation/widget/error_state_widget.dart';
import 'package:gearbox/blogs/presentation/widget/loading/loading_blog_shimmer.dart';
import 'package:gearbox/common/presentation/widget/card_blog.dart';
import 'package:gearbox/core/di.dart';
import 'package:gearbox/core/localization_extension.dart';
import 'package:gearbox/core/route_generator.dart';
import 'package:gearbox/core/style/style_extensions.dart';
import 'package:gearbox/core/utils/utils_date.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BlogsScreen extends StatefulHookConsumerWidget {
  const BlogsScreen({super.key});

  @override
  ConsumerState<StatefulHookConsumerWidget> createState() => _BlogsScreenState();
}

class _BlogsScreenState extends ConsumerState<BlogsScreen> {
  final controller = PageController(viewportFraction: 0.8, keepPage: true);

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(blogNotifierProvider.notifier).getTrendingBlogs(0, 3);
    });
  }

  @override
  Widget build(BuildContext context) {
    Locale locale = Localizations.localeOf(context);

    final blogsState = ref.watch(blogNotifierProvider);
    int pageCount = 0;
    if (blogsState is BlogStateSuccess) {
      pageCount = blogsState.paginatedResponseTrending.content.length;
    }
    return switch (blogsState) {
      BlogStateLoading() => const LoadingBlogShimmer(),
      BlogStateFailure() => const ErrorStateWidget(),
      BlogStateSuccess() => Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(context.blogs, style: context.textTitle),
                            Text(
                              UtilsDate.getFormattedDay(locale, DateTime.now()),
                              style: context.textDescription,
                            ),
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: context.colorShadow),
                            shape: BoxShape.circle,
                          ),
                          padding: const EdgeInsets.all(3),
                          constraints: const BoxConstraints(
                            maxWidth: 35,
                            maxHeight: 35,
                          ),
                          child: IconButton(
                            onPressed: () => _redirectToNotificationScreen(context),
                            padding: const EdgeInsets.all(3),
                            icon: const Icon(Icons.notifications_outlined, size: 20),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxHeight: 300,
                      ),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        controller: controller,
                        itemBuilder: (_, index) => CardBlogTrending(
                          blog: blogsState.paginatedResponseTrending.content[index],
                        ),
                        itemCount: blogsState.paginatedResponseTrending.content.length,
                      ),
                    ),
                    const SizedBox(height: 10),
                    if (pageCount > 0)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        decoration: BoxDecoration(
                          color: context.colorWithOpacity,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: SmoothPageIndicator(
                          controller: controller,
                          count: pageCount,
                          effect: const WormEffect(
                            dotHeight: 10,
                            dotWidth: 10,
                            activeDotColor: Colors.black,
                            type: WormType.thinUnderground,
                          ),
                        ),
                      ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(context.latest, style: context.textCardBlogTitle),
                        GestureDetector(
                            onTap: () => _redirectToBlogListScreen(context),
                            child: Text(context.viewMore, style: context.textLinkThin)),
                      ],
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (_, index) {
                        return CardBlog(
                          blog: blogsState.paginatedResponseLatest.content[index],
                        );
                      },
                      itemCount: 3,
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
    };
  }

  void _redirectToNotificationScreen(final BuildContext context) =>
      Navigator.of(context).pushNamed(RouteGenerator.notificationScreen);

  void _redirectToBlogListScreen(final BuildContext context) =>
      Navigator.of(context).pushNamed(RouteGenerator.blogListScreen);
}
