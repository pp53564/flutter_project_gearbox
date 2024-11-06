import 'package:flutter/material.dart';
import 'package:gearbox/core/style/style_extensions.dart';

class GearboxPrimaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final bool isLoading;

  const GearboxPrimaryButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: context.colorPrimary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        padding: EdgeInsets.zero,
        disabledBackgroundColor: context.colorPrimary,
        elevation: 12,
      ),
      child: Container(
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: isLoading
            ? const CircularProgressIndicator(color: Colors.white)
            : Text(text, style: context.textButton),
      ),
    );
  }
}
