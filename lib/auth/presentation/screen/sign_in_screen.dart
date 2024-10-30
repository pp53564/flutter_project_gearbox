import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gearbox/auth/presentation/controller/state/auth_state.dart';
import 'package:gearbox/auth/presentation/widget/custom_text_form_field.dart';
import 'package:gearbox/common/presentation/widget/custom_snack_bar.dart';
import 'package:gearbox/common/presentation/widget/primary_button.dart';
import 'package:gearbox/common/presentation/widget/title_header.dart';
import 'package:gearbox/core/di.dart';
import 'package:gearbox/core/failure.dart';
import 'package:gearbox/core/localization_extension.dart';
import 'package:gearbox/core/route_generator.dart';
import 'package:gearbox/core/style/style_extensions.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';

class SignInScreen extends StatefulHookConsumerWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
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
                failure is UserIsNotFound ? context.userIsNotFound : failure.toString();
            WidgetsBinding.instance.addPostFrameCallback(
              (_) => CustomSnackBar.show(context, message),
            );
            isLoading.value = false;
            break;
        }
      });
    });

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
                  validationMessages: {
                    'required': (_) => context.emailEmpty,
                    'email': (_) => context.emailValidation,
                  },
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  formControlName: 'password',
                  label: context.passwordHint,
                  isPassword: true,
                  validationMessages: {
                    'required': (_) => context.passwordEmpty,
                    'minLength': (_) => context.passwordMinLength,
                  },
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
                    onPressed: () => _login(context, form),
                    text: context.signIn,
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

  Future<void> _login(final BuildContext context, final FormGroup form) async {
    final email = form.control('email').value;
    final password = form.control('password').value;
    await ref.read(authNotifierProvider.notifier).signIn(email, password);
  }

  void _redirectToSingUpScreen() => Navigator.of(context).pushNamed(RouteGenerator.signUpScreen);
}
