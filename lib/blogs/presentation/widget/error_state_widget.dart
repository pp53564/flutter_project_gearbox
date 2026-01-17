import 'package:flutter/material.dart';
import 'package:gearbox/core/localization_extension.dart';
import 'package:gearbox/core/style/style_extensions.dart';

class ErrorStateWidget extends StatelessWidget {
  const ErrorStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Image(
          image: AssetImage('assets/images/error_404_image.png'),
          height: 150,
          width: 150,
        ),
        Text(context.thereWasAnError, style: context.textStandard),
      ],
    );
  }
}
