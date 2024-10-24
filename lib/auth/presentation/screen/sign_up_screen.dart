import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gearbox/auth/presentation/controller/state/auth_state.dart';
import 'package:gearbox/auth/presentation/widget/custom_text_form_field.dart';
import 'package:gearbox/common/presentation/widget/CustomSnackBar.dart';
import 'package:gearbox/common/presentation/widget/primary_button.dart';
import 'package:gearbox/common/presentation/widget/title_header.dart';
import 'package:gearbox/core/di.dart';
import 'package:gearbox/core/failure.dart';
import 'package:gearbox/core/localization_extension.dart';
import 'package:gearbox/core/route_generator.dart';
import 'package:gearbox/core/style/style_extensions.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';

class SignUpScreen extends StatefulHookConsumerWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final form = FormGroup(
    {
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
      'confirm_password': FormControl<String>(
        validators: [
          Validators.required,
          Validators.minLength(8),
        ],
      ),
    },
    validators: [
      Validators.mustMatch('password', 'confirm_password'),
    ],
  );

  @override
  Widget build(BuildContext context) {
    final isLoading = useState(false);
    final authState = ref.watch(authNotifierProvider);
    useValueChanged<AuthState, void>(authState, (_, __) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        switch (authState) {
          case AuthStateLoading():
            isLoading.value = true;
            break;
          case AuthStateSuccess():
            isLoading.value = false;
            Navigator.pushReplacementNamed(context, RouteGenerator.homeScreen);
            break;
          case AuthStateFailure(failure: final failure):
            String message =
                failure is UserAlreadyExists ? context.userAlreadyExists : failure.toString();
            WidgetsBinding.instance.addPostFrameCallback(
              (_) => CustomSnackBar.show(context, message),
            );
            isLoading.value = false;
            break;
        }
      });
    });
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: ReactiveForm(
            formGroup: form,
            child: Column(
              children: [
                const SizedBox(height: 20),
                TitleHeader(
                  title: context.signUpTitle,
                  subtitle: context.signUpSubTitle,
                ),
                const SizedBox(height: 50),
                CustomTextFormField(
                  formControlName: 'email',
                  label: context.emailHint,
                  validationMessages: {
                    'required': (_) => context.emailEmpty,
                    'email': (_) => context.emailValidation
                  },
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  formControlName: 'username',
                  label: context.usernameHint,
                  validationMessages: {'required': (_) => context.usernameEmpty},
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  formControlName: 'password',
                  label: context.passwordHint,
                  isPassword: true,
                  validationMessages: {
                    'required': (_) => context.passwordEmpty,
                    'minLength': (_) => context.passwordMinLength
                  },
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  formControlName: 'confirm_password',
                  label: context.passwordConfirmHint,
                  isPassword: true,
                  validationMessages: {
                    'required': (_) => context.passwordEmpty,
                    'minLength': (_) => context.passwordMinLength,
                    'mustMatch': (_) => context.passwordsMustMatch
                  },
                ),
                const SizedBox(height: 20),
                ReactiveFormConsumer(
                  key: const Key('submit'),
                  builder: (context, form, _) => PrimaryButton(
                    onPressed: () => _register(context, form),
                    text: context.signUp,
                    isLoading: isLoading.value,
                  ),
                ),
                const Spacer(),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        context.alreadyHaveAccount,
                        style: context.textDescriptionAuth,
                      ),
                      const SizedBox(width: 5),
                      GestureDetector(
                        onTap: _redirectToSingInScreen,
                        child: Text(context.signIn, style: context.textLink),
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

  void _register(final BuildContext context, final FormGroup form) {
    ref.read(authNotifierProvider.notifier).signUp(
          email: form.control('email').value,
          username: form.control('username').value,
          password: form.control('password').value,
          confirmPassword: form.control('confirm_password').value,
        );
  }

  void _redirectToSingInScreen() => Navigator.of(context).pop();
}
