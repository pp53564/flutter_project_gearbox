import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gearbox/auth/data/api/auth_api.dart';
import 'package:gearbox/auth/data/repository/user_repository_impl.dart';
import 'package:gearbox/auth/domain/repository/user_repository.dart';
import 'package:gearbox/auth/domain/usecase/auth_use_case.dart';
import 'package:gearbox/auth/presentation/controller/auth_notifier.dart';
import 'package:gearbox/auth/presentation/controller/state/auth_state.dart';
import 'package:gearbox/blogs/data/api/blog_api.dart';
import 'package:gearbox/blogs/data/repository/blog_repository_impl.dart';
import 'package:gearbox/blogs/domain/entity/blog.dart';
import 'package:gearbox/blogs/domain/repository/blog_repository.dart';
import 'package:gearbox/blogs/domain/usecase/blog_use_case.dart';
import 'package:gearbox/blogs/domain/usecase/like_use_case.dart';
import 'package:gearbox/blogs/presentation/controller/blog_list_pagination_notifier.dart';
import 'package:gearbox/blogs/presentation/controller/blog_notifier.dart';
import 'package:gearbox/blogs/presentation/controller/like_notifier.dart';
import 'package:gearbox/blogs/presentation/controller/state/like_state.dart';
import 'package:gearbox/settings/presentation/controller/locale_notifier.dart';
import 'package:riverpod_infinite_scroll/riverpod_infinite_scroll.dart';

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
final blogLikeUseCaseProvider = Provider<LikeUseCase>(
  (ref) => LikeUseCase(ref.watch(blogRepositoryProvider)),
);

// ***************** RIVERPOD ***************** //
final authNotifierProvider = NotifierProvider<AuthNotifier, AuthState>(() => AuthNotifier());

final localeNotifierProvider = StateNotifierProvider<LocaleNotifier, Locale?>(
  (ref) => LocaleNotifier(),
);

final blogNotifierProvider = StateNotifierProvider<BlogNotifier,
    AsyncValue<({List<Blog> trendingBlogs, List<Blog> latestBlogs})>>((ref) {
  return BlogNotifier(ref.read(blogUseCaseProvider));
});

final blogListPaginationNotifierProvider =
    StateNotifierProvider<BlogListPaginationNotifier, PagedState<int, Blog>>(
        (ref) => BlogListPaginationNotifier(ref.read(blogUseCaseProvider)));

final secureStorageProvider = Provider<FlutterSecureStorage>((ref) {
  return const FlutterSecureStorage();
});

// final likeNotifierProvider = StateNotifierProvider<LikeNotifier, AsyncValue<bool>>(
//   (ref) => LikeNotifier(ref.read(blogLikeUseCaseProvider)),
// );
final likeNotifierProvider = StateNotifierProvider<LikeNotifier, LikeState>(
  (ref) => LikeNotifier(ref.read(blogLikeUseCaseProvider)),
);
