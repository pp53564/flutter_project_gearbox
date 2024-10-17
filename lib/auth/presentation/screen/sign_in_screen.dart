import 'package:flutter/material.dart';
import 'package:gearbox/auth/presentation/widget/custom_text_form_field.dart';
import 'package:gearbox/common/presentation/widget/title_header.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../common/presentation/widget/primary_button.dart';
import '../../../core/constants.dart';

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
    'password': FormControl<String>(validators: [Validators.required]),
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
                  validationMess: {'required': (_) => AppStrings.emailEmpty},
                  obscureText: false,
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  formControlName: 'password',
                  label: AppStrings.passwordHint,
                  validationMess: {
                    'required': (_) {
                      return AppStrings.passwordEmpty;
                    }
                  },
                  obscureText: true,
                ),
                const Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Forgot password?',
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                ),
                const SizedBox(height: 20),
                ReactiveFormConsumer(
                  key: const Key('submit'),
                  builder: (context, form, _) => PrimaryButton(
                    onPressed: () => login(context, form),
                    text: AppStrings.signIn,
                    isLoading: _isLoading,
                  ),
                ),
                const Spacer(),
                const Align(
                  alignment: Alignment.bottomCenter,
                  child: Text('Don’t have an account? Sign up'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  login(context, form) {
    print(form.value);
    // Navigator.push(
    //     context, MaterialPageRoute(builder: (context) => const HomeScreen()));
  }
}
