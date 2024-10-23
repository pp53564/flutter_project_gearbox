import 'package:flutter/material.dart';
import 'package:gearbox/blogs/presentation/widget/card_blog.dart';
import 'package:gearbox/core/localization_extension.dart';
import 'package:gearbox/core/style/style_extensions.dart';
import 'package:gearbox/core/utils/utils_date.dart';

class BlogsScreen extends StatefulWidget {
  const BlogsScreen({super.key});

  @override
  State<BlogsScreen> createState() => _BlogsScreenState();
}

class _BlogsScreenState extends State<BlogsScreen> {
  @override
  Widget build(BuildContext context) {
    Locale locale = Localizations.localeOf(context);
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          children: [
            Row(
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
                const Spacer(),
                RawMaterialButton(
                  onPressed: () {},
                  elevation: 2.0,
                  padding: const EdgeInsets.all(5.0),
                  shape: CircleBorder(side: BorderSide(color: context.colorShadow)),
                  child: const Icon(
                    Icons.notifications_outlined,
                    size: 35.0,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const CardBlog(),
          ],
        ),
      )),
    );
  }
}
