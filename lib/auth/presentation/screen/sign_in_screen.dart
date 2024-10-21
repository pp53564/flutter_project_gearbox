import 'package:flutter/material.dart';
import 'package:gearbox/auth/presentation/widget/custom_text_form_field.dart';
import 'package:gearbox/common/presentation/screen/home_screen.dart';
import 'package:gearbox/common/presentation/widget/primary_button.dart';
import 'package:gearbox/common/presentation/widget/title_header.dart';
import 'package:gearbox/core/localization_extension.dart';
import 'package:gearbox/core/route_generator.dart';
import 'package:gearbox/core/style/style_extensions.dart';
import 'package:reactive_forms/reactive_forms.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final bool _isLoading = false;
  bool hasPasswordError = false;

  final form = FormGroup({
    'email': FormControl<String>(
        validators: [Validators.required, Validators.email]),
    'password': FormControl<String>(
        validators: [Validators.required, Validators.minLength(8)]),
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: ReactiveForm(
            formGroup: form,
            child: Column(
              children: [
                const SizedBox(height: 20),
                TitleHeader(
                  title: context.signInTitle,
                  subtitle: context.signInSubTitle,
                ),
                const SizedBox(height: 50),
                CustomTextFormField(
                  formControlName: 'email',
                  label: context.emailHint,
                  validationMess: {
                    'required': (_) => context.emailEmpty,
                    'email': (_) => context.emailValidation
                  },
                  obscureText: false,
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  formControlName: 'password',
                  label: context.passwordHint,
                  validationMess: {
                    'required': (_) => context.passwordEmpty,
                    'minLength': (_) => context.passwordMinLength
                  },
                  obscureText: true,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: _redirectToSingUpScreen,
                    child: Text(
                      context.forgotPassword,
                      style: const TextStyle(color: Colors.black, fontSize: 12),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ReactiveFormConsumer(
                  key: const Key('submit'),
                  builder: (context, form, _) => PrimaryButton(
                    onPressed: () => login(context, form),
                    text: context.signIn,
                    isLoading: _isLoading,
                  ),
                ),
                const Spacer(),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        context.dontHaveAccount,
                        style: context.textDescriptionAuth,
                      ),
                      const SizedBox(width: 5),
                      GestureDetector(
                        onTap: _redirectToSingUpScreen,
                        child: Text(context.signUp, style: context.textLink),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  login(context, form) {
    print(form.value);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const HomeScreen()));
  }

  void _redirectToSingUpScreen() =>
      Navigator.of(context).pushNamed(RouteGenerator.signUpScreen);
}
