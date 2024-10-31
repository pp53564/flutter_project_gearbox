import 'package:flutter/material.dart';
import 'package:gearbox/common/presentation/widget/blog_info_row.dart';
import 'package:gearbox/core/style/style_extensions.dart';

class CardBlogTrending extends StatelessWidget {
  final String textUrl;
  final DateTime dateTime;
  final int garageNumber;
  final String title;
  final String subtitle;

  const CardBlogTrending(
      {super.key,
      required this.textUrl,
      required this.dateTime,
      required this.garageNumber,
      required this.title,
      required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return
      ConstrainedBox(
        constraints: BoxConstraints(
        maxWidth: 350,
    ),
      Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      color: context.colorBackground,
      elevation: 2,
      child: Container(
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                // Image
                Image.asset(textUrl, fit: BoxFit.cover),
                Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
                    decoration: BoxDecoration(
                      color: context.colorPrimary,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                      child: Text(
                        context.trending,
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Text(title, style: context.textTitleCard),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(subtitle, style: context.textSmallThings),
                BlogInfoRow(dateTime: dateTime, garageNumber: garageNumber),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
