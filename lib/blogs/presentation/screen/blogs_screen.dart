import 'package:flutter/material.dart';
import 'package:gearbox/blogs/presentation/widget/card_blog_info.dart';
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
  final controller = PageController(viewportFraction: 0.9, keepPage: true);

  final pages = List.generate(
      3,
      (index) => CardBlogInfo(
          textUrl: 'assets/images/car.png',
          garageNumber: 69,
          dateTime: DateTime.now().subtract(const Duration(minutes: 35)),
          title: 'BMW released a new concept car',
          subtitle: 'Concepts'));

  final blogList = [
    CardBlog(
      subtitle: 'Technology',
      title: 'Next generation Apple Car Play integration started',
      imageUrl: 'assets/images/laptop.png',
      dateTime: DateTime.now().subtract(const Duration(days: 5)),
      garageNumber: 11,
    ),
    CardBlog(
      subtitle: 'Technology',
      title: 'Next generation Apple Car Play integration started',
      imageUrl: 'assets/images/car2.png',
      dateTime: DateTime.now().add(const Duration(minutes: -30)),
      garageNumber: 11,
    ),
    CardBlog(
      subtitle: 'Technology',
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
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxHeight: 300,
                ),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  controller: controller,
                  itemCount: pages.length,
                  itemBuilder: (_, index) => pages[index % pages.length],
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
                  Text(context.viewMore, style: context.textLinkThin),
                ],
              ),
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
