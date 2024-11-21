import 'package:flutter/material.dart';
import 'package:gearbox/core/localization_extension.dart';
import 'package:gearbox/core/style/style_extensions.dart';

class GearboxSearchBar extends StatefulWidget {
  const GearboxSearchBar({super.key});

  @override
  State<GearboxSearchBar> createState() => _GearboxSearchBar();
}

class _GearboxSearchBar extends State<GearboxSearchBar> {
  String query = '';

  void onQueryChanged(String newQuery) {
    setState(() {
      query = newQuery;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onQueryChanged,
      decoration: InputDecoration(
        labelText: "${context.search}...",
        border: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: context.colorBorder),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
