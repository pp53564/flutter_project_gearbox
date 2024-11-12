import 'package:flutter/material.dart';
import 'package:gearbox/blogs/presentation/widget/loading/loading_card.dart';
import 'package:gearbox/blogs/presentation/widget/loading/loading_placeholder_card.dart';
import 'package:gearbox/core/localization_extension.dart';
import 'package:gearbox/core/style/style_extensions.dart';
import 'package:gearbox/core/utils/utils_date.dart';
import 'package:shimmer/shimmer.dart';

class LoadingBlogShimmer extends StatelessWidget {
  const LoadingBlogShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    Locale locale = Localizations.localeOf(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
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
                      child: const Icon(Icons.notifications_outlined, size: 20),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: context.colorBackground,
                  shadowColor: const Color(0x59DADADA),
                  elevation: 2,
                  child: Column(
                    children: [
                      Container(
                        height: 300,
                        width: double.infinity,
                        alignment: Alignment.topCenter,
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                          enabled: true,
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              PlaceholderCard(width: 330, height: 200),
                              PlaceholderCard(height: 30, width: 330),
                              Spacer(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  PlaceholderCard(height: 15, width: 70),
                                  PlaceholderCard(height: 15, width: 100),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                  decoration: BoxDecoration(
                    color: context.colorPageIndicatorBackground,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(
                      3,
                      (_) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3),
                        child: Container(
                          width: 7,
                          height: 7,
                          decoration: const BoxDecoration(
                            color: Colors.grey,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
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
                  children: List.generate(3, (index) {
                    return const LoadingCard();
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
