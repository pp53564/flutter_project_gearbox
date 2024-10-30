import 'package:flutter/material.dart';
import 'package:gearbox/core/style/style_extensions.dart';

class NotificationRow extends StatelessWidget {
  final String avatarUrl;
  final String text;
  final String username;
  final String imageBlogUrl;

  const NotificationRow(
      {super.key,
      required this.avatarUrl,
      required this.text,
      required this.username,
      required this.imageBlogUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage(avatarUrl),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  username,
                  style: context.textDescriptionAuth,
                ),
                Text(
                  text,
                  style: context.textPlaceholder,
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
          Image.asset(
            imageBlogUrl,
            height: 45,
            width: 45,
          ),
        ],
      ),
    );
  }
}
