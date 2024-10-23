import 'package:flutter/material.dart';
import 'package:gearbox/core/style/style_extensions.dart';

class CardBlog extends StatelessWidget {
  const CardBlog({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      color: context.colorBackground,
      elevation: 5,
      child: Container(
        width: 350,
        height: 270,
        alignment: Alignment.center,
        child: Image.asset(
          'assets/images/car.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
