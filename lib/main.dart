import 'package:flutter/material.dart';
import 'package:gearbox/core/route_generator.dart';
import 'package:gearbox/core/style/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: RouteGenerator.signInScreen,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
