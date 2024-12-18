import 'package:flutter/material.dart';
import 'package:gearbox/auth/presentation/screen/sign_in_screen.dart';
import 'package:gearbox/auth/presentation/screen/sign_up_screen.dart';
import 'package:gearbox/blogs/presentation/screen/blog_details_screen.dart';
import 'package:gearbox/blogs/presentation/screen/blogs_screen.dart';
import 'package:gearbox/blogs/presentation/screen/notification_screen.dart';
import 'package:gearbox/common/presentation/screen/home_screen.dart';

class RouteGenerator {
  static const String signInScreen = '/signIn';
  static const String signUpScreen = '/signUp';
  static const String homeScreen = '/home';
  static const String blogsScreen = '/blogs';
  static const String blogDetailsScreen = '/details';
  static const String notificationScreen = '/notifications';

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
      case RouteGenerator.blogDetailsScreen:
        return MaterialPageRoute(builder: (_) => const BlogDetailsScreen());
      case RouteGenerator.notificationScreen:
        return MaterialPageRoute(builder: (_) => const NotificationScreen());
      default:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
    }
  }
}
