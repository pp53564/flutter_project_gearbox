import 'package:flutter/material.dart';

import '../../../blogs/presentation/screen/blogs_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedScreenIndex = 0;

  final _screens = const [
    BlogsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: _screens[_selectedScreenIndex]));
  }
}
