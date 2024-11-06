import 'package:flutter/material.dart';
import 'package:gearbox/core/style/style_extensions.dart';

class ButtonComment extends StatelessWidget {
  const ButtonComment({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 45,
        maxHeight: 45,
      ),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: context.colorPrimary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          padding: EdgeInsets.zero,
          disabledBackgroundColor: context.colorPrimary,
          elevation: 12,
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 5, left: 5),
          child: Center(
            child: Transform.rotate(
              angle: -0.7854,
              child: const Icon(
                Icons.send,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
