import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gearbox/auth/domain/usecase/auth_use_case.dart';
import 'package:gearbox/auth/presentation/controller/state/auth_state.dart';
import 'package:gearbox/core/di.dart';

class AuthNotifier extends Notifier<AuthState> {
  late final AuthUseCase usecase;

  @override
  build() {
    usecase = ref.watch(authUseCaseProvider);
    return AuthStateFailure();
  }

  Future<void> signIn(String email, String password) async {
    state = AuthStateLoading();
    final result = await usecase.signIn(email, password);

    result.fold(
      (failure) => state = AuthStateFailure(failure: failure),
      (user) => state = AuthStateSuccess(user),
    );
  }

  void signUp({
    required String email,
    required String username,
    required String password,
    required String confirmPassword,
  }) async {
    state = AuthStateLoading();
    final result = await usecase.signUp(email, username, password, confirmPassword);

    result.fold(
      (failure) => state = AuthStateFailure(failure: failure),
      (user) => state = AuthStateSuccess(user),
    );
  }
}
