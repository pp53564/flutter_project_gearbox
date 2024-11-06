import 'package:flutter/material.dart';
import 'package:gearbox/blogs/presentation/widget/avatar_row.dart';
import 'package:gearbox/blogs/presentation/widget/bottom_sheet/blog_bottom_sheet_actions.dart';
import 'package:gearbox/common/presentation/widget/button/gearbox_back_button.dart';
import 'package:gearbox/core/style/style_extensions.dart';

class BlogDetailsScreen extends StatelessWidget {
  const BlogDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const String textBlog =
        "Next-generation CarPlay will have deeper integration with a vehicle's instrument cluster, climate controls, FM radio, and more.It will also support multiple displays across the dashboard, and offer a variety of personalization options.\n\n"
        "Aston Martin and Porsche previewed their customized next-generation CarPlay designs in December. Aston Martin said it would release its first vehicles with next-generation CarPlay support in 2024, including a new model of its high-end DB12 sports car. Porsche did not provide a timeframe or specific details about its own plans.\n\n"
        "A spokesperson for Porsche this week told us that it has no update to provide about next-generation CarPlay availability at this time, while a spokesperson for Aston Martin has yet to respond to our request for comment.\n\n"
        "A spokesperson for Porsche this week told us that it has no update to provide about next-generation CarPlay availability at this time, while a spokesperson for Aston Martin has yet to respond to our request for comment.\n\n";

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        backgroundColor: context.colorBackground,
        leading: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: GearboxBackButton(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const AvatarRow(
                  username: '@brunobenner',
                  avatarUrl: 'assets/images/avatar.png',
                ),
                const SizedBox(height: 20),
                Text(
                  'Next generation Apple Car Play integration started',
                  style: context.textTitle,
                ),
                const SizedBox(height: 20),
                Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width,
                    maxHeight: 200,
                  ),
                  width: double.infinity,
                  child: Image.asset(
                    'assets/images/screen2.png',
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Icon(
                      Icons.access_time_outlined,
                      color: context.colorPaginationContainer,
                      size: 16,
                    ),
                    const SizedBox(width: 2),
                    Text('30 min ago', style: context.textSmallThings),
                    const SizedBox(width: 22),
                    Text('Technology', style: context.textSmallThings),
                  ],
                ),
                const SizedBox(height: 20),
                Text(textBlog, style: context.textDescription),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: const BlogBottomSheetActions(),
    );
  }
}
