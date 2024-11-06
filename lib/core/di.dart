import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gearbox/auth/data/api/auth_api.dart';
import 'package:gearbox/auth/data/repository/user_repository_impl.dart';
import 'package:gearbox/auth/domain/repository/user_repository.dart';
import 'package:gearbox/auth/domain/usecase/auth_use_case.dart';
import 'package:gearbox/auth/presentation/controller/auth_notifier.dart';
import 'package:gearbox/auth/presentation/controller/state/auth_state.dart';
import 'package:gearbox/blogs/data/api/blog_api.dart';
import 'package:gearbox/blogs/data/repository/blog_repository_impl.dart';
import 'package:gearbox/blogs/domain/repository/blog_repository.dart';
import 'package:gearbox/blogs/domain/usecase/blog_use_case.dart';
import 'package:gearbox/blogs/presentation/controller/blog_list_pagination_notifier.dart';
import 'package:gearbox/blogs/presentation/controller/blog_notifier.dart';
import 'package:gearbox/blogs/presentation/controller/state/blog_state.dart';
import 'package:gearbox/settings/presentation/controller/locale_notifier.dart';

final dioProvider = Provider<Dio>((ref) => Dio());
final authApiProvider = Provider<AuthApi>((ref) => AuthApi(ref.watch(dioProvider)));
final blogApiProvider = Provider<BlogApi>((ref) => BlogApi(ref.watch(dioProvider)));

// ***************** REPOSITORY ***************** //
final userRepositoryProvider = Provider<UserRepository>(
  (ref) => UserRepositoryImpl(ref.watch(authApiProvider)),
);
final blogRepositoryProvider = Provider<BlogRepository>(
  (ref) => BlogRepositoryImpl(ref.watch(blogApiProvider)),
);

// ***************** USE CASE ***************** //
final authUseCaseProvider = Provider<AuthUseCase>(
  (ref) => AuthUseCase(ref.watch(userRepositoryProvider)),
);
final blogUseCaseProvider = Provider<BlogUseCase>(
  (ref) => BlogUseCase(ref.watch(blogRepositoryProvider)),
);

// ***************** RIVERPOD ***************** //
final authNotifierProvider = NotifierProvider<AuthNotifier, AuthState>(() => AuthNotifier());

final localeNotifierProvider = StateNotifierProvider<LocaleNotifier, Locale?>(
  (ref) => LocaleNotifier(),
);

final blogNotifierProvider = NotifierProvider<BlogNotifier, BlogState>(() => BlogNotifier());

final blogLatestNotifierProvider =
    NotifierProvider<BlogLatestNotifier, BlogState>(() => BlogLatestNotifier());
