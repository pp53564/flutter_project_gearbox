import 'package:flutter/material.dart';

class PlaceholderCard extends StatelessWidget {
  final double height;
  final double width;

  const PlaceholderCard({super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: SizedBox(
        height: height,
        width: width,
      ),
    );
  }
}
