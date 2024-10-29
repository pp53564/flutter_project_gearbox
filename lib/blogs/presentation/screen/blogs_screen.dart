import 'package:flutter/material.dart';
import 'package:gearbox/blogs/presentation/widget/card_blog_trending.dart';
import 'package:gearbox/common/presentation/widget/card_blog.dart';
import 'package:gearbox/core/localization_extension.dart';
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
      (index) => CardBlogTrending(
          textUrl: 'assets/images/car.png',
          garageNumber: 69,
          dateTime: DateTime.now().subtract(const Duration(minutes: 35)),
          title: 'BMW released a new concept car',
          subtitle: 'Concepts'));

  final blogList = [
    CardBlog(
      type: 'Technology',
      title: 'Next generation Apple Car Play integration started',
      imageUrl: 'assets/images/screen.png',
      dateTime: DateTime.now().add(const Duration(days: -5)),
      garageNumber: 11,
    ),
    CardBlog(
      type: 'Hot new',
      title: 'Next generation Apple Car Play integration started',
      imageUrl: 'assets/images/car2.png',
      dateTime: DateTime.now().add(const Duration(minutes: -30)),
      garageNumber: 11,
    ),
    CardBlog(
      type: 'Electric cars',
      title: 'Next generation Apple Car Play integration started',
      imageUrl: 'assets/images/car3.png',
      dateTime: DateTime.now().add(const Duration(minutes: -30)),
      garageNumber: 11,
    )
  ];

  @override
  Widget build(BuildContext context) {
    Locale locale = Localizations.localeOf(context);
    return Scaffold(
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
                      )
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
                      onPressed: () {},
                      padding: const EdgeInsets.all(3),
                      icon: const Icon(Icons.notifications_outlined, size: 20),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              AspectRatio(
                aspectRatio: 12 / 10,
                child: PageView.builder(
                  controller: controller,
                  itemCount: pages.length,
                  itemBuilder: (_, index) {
                    return pages[index % pages.length];
                  },
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                  color: context.colorWithOpacity,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: SmoothPageIndicator(
                  controller: controller,
                  count: pages.length,
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
                  Text(context.viewMore, style: context.textLinkThin)
                ],
              ),
              // Expanded(
              //   child: ListView.builder(
              //     scrollDirection: Axis.vertical,
              //     itemBuilder: (_, index) {
              //       return blogList[index % blogList.length];
              //     },
              //     itemCount: blogList.length,
              //   ),
              // ),
              Column(
                children: blogList.map((blog) => blog).toList(),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
