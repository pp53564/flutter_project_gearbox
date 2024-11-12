import 'package:flutter/material.dart';
import 'package:gearbox/core/style/style_extensions.dart';

class BlogBottomSheetButton extends StatelessWidget {
  final String? text;
  final Icon icon;
  final VoidCallback? onPressed;

  const BlogBottomSheetButton({
    super.key,
    this.text,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6,
              spreadRadius: 2,
            ),
          ],
        ),
        height: 35,
        width: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 25, width: 25, child: icon),
            if (text != null)
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  text!,
                  style: TextStyle(
                    fontSize: 16,
                    color: context.colorPlaceholder,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
