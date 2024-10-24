import 'package:flutter/material.dart';
import 'package:gearbox/auth/presentation/screen/sign_in_screen.dart';
import 'package:gearbox/auth/presentation/screen/sign_up_screen.dart';
import 'package:gearbox/blogs/presentation/screen/blogs_screen.dart';
import 'package:gearbox/common/presentation/screen/home_screen.dart';

class RouteGenerator {
  static const String signInScreen = '/signIn';
  static const String signUpScreen = '/signUp';
  static const String homeScreen = '/home';
  static const String blogsScreen = '/blogs';

  RouteGenerator._();

  static Route<dynamic> generateRoute(final RouteSettings settings) {
    switch (settings.name) {
      case RouteGenerator.signInScreen:
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      case RouteGenerator.signUpScreen:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case RouteGenerator.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case RouteGenerator.blogsScreen:
        return MaterialPageRoute(builder: (_) => const BlogsScreen());
      default:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
    }
  }
}
