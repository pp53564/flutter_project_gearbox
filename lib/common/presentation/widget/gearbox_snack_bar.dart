import 'package:flutter/material.dart';
import 'package:gearbox/core/style/style_extensions.dart';

class GearboxSnackBar {
  const GearboxSnackBar._();

  static void show(BuildContext context, final String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, color: Colors.red),
            const SizedBox(width: 5),
            Text(text, style: context.textDescriptionAuth),
          ],
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.fromLTRB(10, 0, 10, 30),
        backgroundColor: context.colorBackground,
        elevation: 5,
        padding: const EdgeInsets.all(10),
      ),
    );
  }
}
