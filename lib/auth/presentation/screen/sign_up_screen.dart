import 'package:flutter/material.dart';
import 'package:gearbox/common/presentation/widget/primary_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Column(children: [
            PrimaryButton(
                onPressed: onPressed, text: 'Sign up', isLoading: _isLoading),
          ]),
        ),
      ),
    );
  }

  void onPressed() {}
}
