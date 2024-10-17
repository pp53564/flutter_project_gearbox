import 'package:flutter/material.dart';
import 'package:gearbox/core/style/style_extensions.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CustomTextFormField extends StatelessWidget {
  final String formControlName;
  final String label;
  final bool obscureText;
  final Map<String, String Function(Object)>? validationMess;

  const CustomTextFormField({
    super.key,
    required this.formControlName,
    required this.label,
    required this.obscureText,
    this.validationMess,
  });

  @override
  Widget build(BuildContext context) {
    return ReactiveTextField<String>(
      formControlName: formControlName,
      validationMessages: validationMess,
      obscureText: obscureText,
      decoration: InputDecoration(
        fillColor: context.colorBackground,
        labelText: label,
        labelStyle: context.textPlaceholder,
        hintText: label,
        filled: true,
        alignLabelWithHint: true,
        isDense: true,
        border: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: context.colorBorder),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
