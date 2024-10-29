import 'package:flutter/material.dart';
import 'package:gearbox/core/style/style_extensions.dart';

class AvatarRow extends StatelessWidget {
  final String username;
  final String? comment;
  final String avatarUrl;

  const AvatarRow({super.key, required this.username, this.comment, required this.avatarUrl});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: comment != null ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 15,
          backgroundImage: AssetImage(avatarUrl),
        ),
        const SizedBox(width: 7),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: comment != null ? 0 : 2),
                child: Text(
                  username,
                  style: context.textSmallThings,
                ),
              ),
              if (comment != null)
                Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Text(
                    comment!,
                    style: context.textDescription,
                    textAlign: TextAlign.justify,
                  ),
                ),
              if (comment != null) const SizedBox(height: 10),
            ],
          ),
        ),
      ],
    );
  }
}
