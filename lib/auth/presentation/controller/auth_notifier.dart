import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gearbox/auth/domain/entity/user.dart';
import 'package:gearbox/auth/domain/usecase/auth_use_case.dart';
import 'package:gearbox/auth/presentation/controller/state/auth_state.dart';
import 'package:gearbox/core/di.dart';

class AuthNotifier extends Notifier<AuthState> {
  late final AuthUseCase usecase;
  late final FlutterSecureStorage _secureStorage;

  @override
  build() {
    usecase = ref.watch(authUseCaseProvider);
    _secureStorage = ref.watch(secureStorageProvider);
    return AuthStateFailure();
  }

  Future<void> signIn(String email, String password) async {
    state = AuthStateLoading();
    final result = await usecase.signIn(email, password);

    result.fold((failure) => state = AuthStateFailure(failure: failure), (user) {
      _saveUserToSecureStorage(user);
      return state = AuthStateSuccess(user);
    });
  }

  void signUp({
    required String email,
    required String username,
    required String password,
    required String confirmPassword,
  }) async {
    state = AuthStateLoading();
    final result = await usecase.signUp(email, username, password, confirmPassword);

    result.fold((failure) => state = AuthStateFailure(failure: failure), (user) {
      _saveUserToSecureStorage(user);
      return state = AuthStateSuccess(user);
    });
  }

  Future<void> _saveUserToSecureStorage(User user) async {
    final userJson = json.encode(user);
    await _secureStorage.write(key: "KEY_USER_DATA", value: userJson);
    await _secureStorage.write(key: "KEY_USER_ID", value: user.id.toString());
  }
}
