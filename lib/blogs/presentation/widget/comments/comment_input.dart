import 'package:flutter/material.dart';
import 'package:gearbox/core/localization_extension.dart';
import 'package:gearbox/core/style/style_extensions.dart';

class CommentInput extends StatelessWidget {
  const CommentInput({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: context.commentPlaceholder,
        border: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: context.colorShadow),
          borderRadius: BorderRadius.circular(5),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: context.colorBorder,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      ),
    );
  }
}
