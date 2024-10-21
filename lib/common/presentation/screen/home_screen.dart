import 'package:flutter/material.dart';
import 'package:gearbox/core/style/style_extensions.dart';

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
    BlogsScreen(),
    BlogsScreen(),
    BlogsScreen(),
    BlogsScreen(),
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
            icon: const Icon(
              Icons.article_outlined,
            ),
            label: 'Blogs',
            activeIcon: Icon(
              Icons.article,
              color: context.colorBottomNavigationIcon,
            ),
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Explore',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined),
            label: 'New',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border_outlined),
            label: 'Saved',
            activeIcon: Icon(Icons.bookmark),
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Garage',
          ),
        ],
      ),
    );
  }
}
