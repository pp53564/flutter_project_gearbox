import 'package:flutter/material.dart';
import 'package:gearbox/blogs/presentation/widget/blog_trending_card.dart';
import 'package:gearbox/blogs/presentation/widget/error_state_widget.dart';
import 'package:gearbox/blogs/presentation/widget/loading/loading_blog_shimmer.dart';
import 'package:gearbox/common/presentation/widget/blog_card.dart';
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
  final controller = PageController(viewportFraction: 1.0, keepPage: true);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final Locale locale = Localizations.localeOf(context);
    final blogs = ref.watch(blogNotifierProvider);

    return blogs.when(
      error: (_, __) => const ErrorStateWidget(),
      loading: () => const LoadingBlogShimmer(),
      data: (blogs) => Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                  if (blogs.trendingBlogs.isNotEmpty)
                    ConstrainedBox(
                      constraints: BoxConstraints(maxHeight: screenSize.height * 0.34),
                      child: PageView.builder(
                        scrollDirection: Axis.horizontal,
                        controller: controller,
                        itemBuilder: (_, index) => BlogTrendingCard(
                          blog: blogs.trendingBlogs[index],
                        ),
                        itemCount: blogs.trendingBlogs.length,
                      ),
                    ),
                  if (blogs.trendingBlogs.isEmpty)
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Text(context.noTrendingBlogs, style: context.textDescription),
                    ),
                  const SizedBox(height: 10),
                  if (blogs.trendingBlogs.isNotEmpty)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                      decoration: BoxDecoration(
                        color: context.colorPageIndicatorBackground,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: SmoothPageIndicator(
                        controller: controller,
                        count: blogs.trendingBlogs.length,
                        effect: const WormEffect(
                          dotHeight: 7,
                          dotWidth: 7,
                          activeDotColor: Colors.black,
                          type: WormType.thinUnderground,
                        ),
                      ),
                    ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(context.latest, style: context.textCardBlogTitle),
                      GestureDetector(
                        onTap: () => _redirectToBlogListScreen(context),
                        child: Text(context.viewMore, style: context.textLinkThin),
                      ),
                    ],
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemBuilder: (_, index) {
                      return BlogCard(
                        blog: blogs.latestBlogs[index],
                      );
                    },
                    itemCount: 3,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _redirectToNotificationScreen(final BuildContext context) =>
      Navigator.of(context).pushNamed(RouteGenerator.notificationScreen);

  void _redirectToBlogListScreen(final BuildContext context) =>
      Navigator.of(context).pushNamed(RouteGenerator.blogListScreen);
}
