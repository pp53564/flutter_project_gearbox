import 'package:flutter/material.dart';
import 'package:gearbox/blogs/presentation/widget/blog_trending_card.dart';
import 'package:gearbox/common/presentation/widget/blog_card.dart';
import 'package:gearbox/core/localization_extension.dart';
import 'package:gearbox/core/route_generator.dart';
import 'package:gearbox/core/style/style_extensions.dart';
import 'package:gearbox/core/utils/utils_date.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BlogsScreen extends StatefulWidget {
  const BlogsScreen({super.key});

  @override
  State<BlogsScreen> createState() => _BlogsScreenState();
}

class _BlogsScreenState extends State<BlogsScreen> {
  final controller = PageController(viewportFraction: 0.8, keepPage: true);
  final pages = List.generate(
    3,
    (index) => BlogTrendingCard(
        textUrl: 'assets/images/car.png',
        numOfLikes: 69,
        dateTime: DateTime.now().subtract(const Duration(minutes: 35)),
        title: 'BMW released a new concept car',
        subtitle: 'Concepts'),
  );

  final blogList = [
    BlogCard(
      type: 'Technology',
      title: 'Next generation Apple Car Play integration started',
      imageUrl: 'assets/images/screen.png',
      dateTime: DateTime.now().add(const Duration(days: -5)),
      numOfLikes: 11,
    ),
    BlogCard(
      type: 'Hot new',
      title: 'Next generation Apple Car Play integration started',
      imageUrl: 'assets/images/car2.png',
      dateTime: DateTime.now().add(const Duration(minutes: -30)),
      numOfLikes: 11,
    ),
    BlogCard(
      type: 'Electric cars',
      title: 'Next generation Apple Car Play integration started',
      imageUrl: 'assets/images/car3.png',
      dateTime: DateTime.now().add(const Duration(minutes: -30)),
      numOfLikes: 11,
    )
  ];

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final Locale locale = Localizations.localeOf(context);

    return Scaffold(
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
                ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: screenSize.height * 0.34),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    controller: controller,
                    itemCount: pages.length,
                    itemBuilder: (_, index) => pages[index % pages.length],
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                  decoration: BoxDecoration(
                    color: context.colorPageIndicatorBackground,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: SmoothPageIndicator(
                    controller: controller,
                    count: pages.length,
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
                    Text(context.viewMore, style: context.textLinkThin),
                  ],
                ),
                ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) => blogList[index],
                  separatorBuilder: (_, __) => const SizedBox(height: 5),
                  itemCount: blogList.length,
                  physics: const ClampingScrollPhysics(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _redirectToNotificationScreen(final BuildContext context) =>
      Navigator.of(context).pushNamed(RouteGenerator.notificationScreen);
}
