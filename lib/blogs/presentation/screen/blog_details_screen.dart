import 'package:flutter/material.dart';
import 'package:gearbox/blogs/presentation/widget/bottom_container.dart';
import 'package:gearbox/common/presentation/widget/back_button.dart';
import 'package:gearbox/core/style/style_extensions.dart';

class BlogDetailsScreen extends StatelessWidget {
  const BlogDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String textBlog =
        "Next-generation CarPlay will have deeper integration with a vehicle's instrument cluster, climate controls, FM radio, and more.It will also support multiple displays across the dashboard, and offer a variety of personalization options.\n\n"
        "Aston Martin and Porsche previewed their customized next-generation CarPlay designs in December. Aston Martin said it would release its first vehicles with next-generation CarPlay support in 2024, including a new model of its high-end DB12 sports car. Porsche did not provide a timeframe or specific details about its own plans.\n\n"
        "A spokesperson for Porsche this week told us that it has no update to provide about next-generation CarPlay availability at this time, while a spokesperson for Aston Martin has yet to respond to our request for comment.\n\n"
        "A spokesperson for Porsche this week told us that it has no update to provide about next-generation CarPlay availability at this time, while a spokesperson for Aston Martin has yet to respond to our request for comment.\n\n";
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: BackButtonCustom(),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage('assets/images/avatar.png'),
                    ),
                    const SizedBox(width: 7),
                    Text('@brunobenner', style: context.textPlaceholder),
                  ],
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
      bottomSheet: Container(
        color: context.colorBottomNavigationRow,
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BottomContainer(
                  text: '3',
                  icon: Icon(
                    Icons.settings_outlined,
                    color: context.colorPlaceholder,
                  ),
                ),
                const SizedBox(width: 10),
                BottomContainer(
                  text: '3',
                  icon: Icon(
                    Icons.comment_outlined,
                    color: context.colorPlaceholder,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 30),
            BottomContainer(
              icon: Icon(
                Icons.bookmark_border_outlined,
                color: context.colorPlaceholder,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
