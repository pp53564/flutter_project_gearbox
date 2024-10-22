import 'package:flutter/material.dart';
import 'package:gearbox/auth/presentation/widget/custom_text_form_field.dart';
import 'package:gearbox/common/presentation/widget/primary_button.dart';
import 'package:gearbox/common/presentation/widget/title_header.dart';
import 'package:gearbox/core/constants.dart';
import 'package:gearbox/core/style/style_extensions.dart';
import 'package:reactive_forms/reactive_forms.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final bool _isLoading = false;

  final form = FormGroup({
    'email': FormControl<String>(validators: [
      Validators.required,
      Validators.email,
    ]),
    'username': FormControl<String>(
      validators: [Validators.required],
    ),
    'password': FormControl<String>(validators: [
      Validators.required,
      Validators.minLength(8),
    ]),
    'confirm_password': FormControl<String>(validators: [
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
                  title: AppStrings.signUpTitle,
                  subtitle: AppStrings.signUpSubTitle,
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
                  formControlName: 'username',
                  label: AppStrings.usernameHint,
                  validationMessages: {
                    'required': (_) => AppStrings.usernameEmpty
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
                const SizedBox(height: 20),
                CustomTextFormField(
                  formControlName: 'confirm_password',
                  label: AppStrings.passwordConfirmHint,
                  isPassword: true,
                  validationMessages: {
                    'required': (_) => AppStrings.passwordEmpty,
                    'minLength': (_) => AppStrings.passwordMinLength
                  },
                ),
                const SizedBox(height: 20),
                ReactiveFormConsumer(
                  key: const Key('submit'),
                  builder: (context, form, _) => PrimaryButton(
                    onPressed: () => _register(context, form),
                    text: AppStrings.signUp,
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
                        AppStrings.alreadyHaveAccount,
                        style: context.textDescriptionAuth,
                      ),
                      const SizedBox(width: 5),
                      GestureDetector(
                        onTap: _redirectToSingInScreen,
                        child: Text(AppStrings.signIn, style: context.textLink),
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

  void _register(final BuildContext context, final FormGroup form) =>
      print(form.value);

  void _redirectToSingInScreen() => Navigator.of(context).pop();
}
