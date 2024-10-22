import 'package:flutter/material.dart';
import 'package:gearbox/auth/presentation/widget/custom_text_form_field.dart';
import 'package:gearbox/common/presentation/screen/home_screen.dart';
import 'package:gearbox/common/presentation/widget/primary_button.dart';
import 'package:gearbox/common/presentation/widget/title_header.dart';
import 'package:gearbox/core/constants.dart';
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

  final form = FormGroup({
    'email': FormControl<String>(validators: [
      Validators.required,
      Validators.email,
    ]),
    'password': FormControl<String>(validators: [
      Validators.required,
      Validators.minLength(8),
    ]),
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
                const TitleHeader(
                  title: AppStrings.signInTitle,
                  subtitle: AppStrings.signInSubTitle,
                ),
                const SizedBox(height: 50),
                CustomTextFormField(
                  formControlName: 'email',
                  label: AppStrings.emailHint,
                  validationMessages: {
                    'required': (_) => AppStrings.emailEmpty,
                    'email': (_) => AppStrings.emailValidation
                  },
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  formControlName: 'password',
                  label: AppStrings.passwordHint,
                  isPassword: true,
                  validationMessages: {
                    'required': (_) => AppStrings.passwordEmpty,
                    'minLength': (_) => AppStrings.passwordMinLength
                  },
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: _redirectToSingUpScreen,
                    child: const Text(
                      AppStrings.forgotPassword,
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ReactiveFormConsumer(
                  key: const Key('submit'),
                  builder: (context, form, _) => PrimaryButton(
                    onPressed: () => _login(context, form),
                    text: AppStrings.signIn,
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
                        AppStrings.dontHaveAccount,
                        style: context.textDescriptionAuth,
                      ),
                      const SizedBox(width: 5),
                      GestureDetector(
                        onTap: _redirectToSingUpScreen,
                        child: Text(AppStrings.signUp, style: context.textLink),
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

  void _login(final BuildContext context, final FormGroup form) {
    print(form.value);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const HomeScreen()));
  }

  void _redirectToSingUpScreen() =>
      Navigator.of(context).pushNamed(RouteGenerator.signUpScreen);
}
