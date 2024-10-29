import 'package:flutter/material.dart';

class CloseButtonCustom extends StatelessWidget {
  const CloseButtonCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(
          Icons.close,
          color: Colors.grey[600],
          size: 20,
        ),
        padding: EdgeInsets.zero,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
