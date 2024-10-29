import 'package:flutter/material.dart';
import 'package:gearbox/core/style/style_extensions.dart';

class NotificationRow extends StatelessWidget {
  final String avatarUrl;

  const NotificationRow({super.key, required this.avatarUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage(avatarUrl),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 2),
                Text(
                  "@theresawalter",
                  style: context.textDescriptionAuth,
                ),
                Text(
                  "liked your blog.",
                  style: context.textPlaceholder,
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
