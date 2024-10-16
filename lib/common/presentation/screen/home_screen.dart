import 'package:flutter/material.dart';
import 'package:gearbox/auth/presentation/screen/sign_in_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedScreenIndex = 0;

  final _screens = const [
    SignInScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: _screens[_selectedScreenIndex]));
  }
}
