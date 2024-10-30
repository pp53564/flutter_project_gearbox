import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gearbox/auth/data/api/auth_api.dart';
import 'package:gearbox/auth/data/repository/user_repository_impl.dart';
import 'package:gearbox/auth/domain/repository/user_repository.dart';
import 'package:gearbox/auth/domain/usecase/auth_use_case.dart';
import 'package:gearbox/auth/presentation/controller/auth_notifier.dart';
import 'package:gearbox/auth/presentation/controller/state/auth_state.dart';
import 'package:gearbox/settings/presentation/controller/locale_notifier.dart';

final dioProvider = Provider<Dio>((ref) => Dio());
final authApiProvider = Provider<AuthApi>((ref) => AuthApi(ref.watch(dioProvider)));

final userRepositoryProvider = Provider<UserRepository>(
  (ref) => UserRepositoryImpl(ref.watch(authApiProvider)),
);

final authUseCaseProvider = Provider<AuthUseCase>(
  (ref) => AuthUseCase(ref.watch(userRepositoryProvider)),
);

final authNotifierProvider = NotifierProvider<AuthNotifier, AuthState>(() => AuthNotifier());

final localeNotifierProvider = StateNotifierProvider<LocaleNotifier, Locale?>(
  (ref) => LocaleNotifier(),
);
