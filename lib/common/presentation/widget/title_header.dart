import 'package:flutter/material.dart';
import 'package:gearbox/core/style/style_extensions.dart';

class TitleHeader extends StatelessWidget {
  final String title;
  final String subtitle;

  const TitleHeader({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: context.textTitle,
            textAlign: TextAlign.left,
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            subtitle,
            style: context.textDescriptionAuth,
          ),
        )
      ],
    );
  }
}
