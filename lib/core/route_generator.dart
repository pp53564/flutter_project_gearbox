import 'package:flutter/material.dart';
import 'package:gearbox/auth/presentation/screen/sign_in_screen.dart';
import 'package:gearbox/auth/presentation/screen/sign_up_screen.dart';
import 'package:gearbox/common/presentation/screen/home_screen.dart';

class RouteGenerator {
  static const signInScreen = '/signIn';
  static const signUpScreen = '/signUp';
  static const homeScreen = '/home';

  RouteGenerator._();

  static Route<dynamic> generateRoute(final RouteSettings settings) {
    switch (settings.name) {
      case RouteGenerator.signInScreen:
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      case RouteGenerator.signUpScreen:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case RouteGenerator.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
    }
  }
}
