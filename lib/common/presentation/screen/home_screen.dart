import 'package:flutter/material.dart';
import 'package:gearbox/blogs/presentation/screen/blogs_screen.dart';
import 'package:gearbox/core/localization_extension.dart';
import 'package:gearbox/core/style/style_extensions.dart';
import 'package:gearbox/settings/presentation/screen/settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedScreenIndex = 0;

  final _screens = const [
    BlogsScreen(),
    BlogsScreen(),
    BlogsScreen(),
    BlogsScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _screens[_selectedScreenIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedScreenIndex,
        selectedItemColor: context.colorBottomNavigationIcon,
        onTap: (index) => setState(() => _selectedScreenIndex = index),
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.article_outlined),
            label: context.blogs,
            activeIcon: Icon(
              Icons.article,
              color: context.colorBottomNavigationIcon,
            ),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.search),
            label: context.explore,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.add_box_outlined),
            label: context.newBottomNavigation,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.bookmark_border_outlined),
            label: context.saved,
            activeIcon: const Icon(Icons.bookmark),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings),
            label: context.garage,
          ),
        ],
      ),
    );
  }
}
