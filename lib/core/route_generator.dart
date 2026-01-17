import 'package:flutter/material.dart';
import 'package:gearbox/auth/presentation/controller/state/auth_state.dart';
import 'package:gearbox/auth/presentation/screen/sign_in_screen.dart';
import 'package:gearbox/auth/presentation/screen/sign_up_screen.dart';
import 'package:gearbox/blogs/presentation/screen/blog_details_screen.dart';
import 'package:gearbox/blogs/presentation/screen/blog_list_screen.dart';
import 'package:gearbox/blogs/presentation/screen/blog_screen.dart';
import 'package:gearbox/blogs/presentation/screen/notification_screen.dart';
import 'package:gearbox/common/presentation/screen/home_screen.dart';

class RouteGenerator {
  static const String signInScreen = '/signIn';
  static const String signUpScreen = '/signUp';
  static const String homeScreen = '/home';
  static const String blogsScreen = '/blogs';
  static const String blogDetailsScreen = '/details';
  static const String notificationScreen = '/notifications';
  static const String blogListScreen = '/allBlogs';

  RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings, AuthState authState) {
    switch (settings.name) {
      case signInScreen:
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      case signUpScreen:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case blogsScreen:
        return MaterialPageRoute(builder: (_) => const BlogsScreen());
      case blogDetailsScreen:
        return MaterialPageRoute(
          builder: (_) => const BlogDetailsScreen(),
          settings: settings,
        );
      case notificationScreen:
        return MaterialPageRoute(builder: (_) => const NotificationScreen());
      case blogListScreen:
        return MaterialPageRoute(builder: (_) => const BlogListScreen());
      default:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
    }
  }
}
