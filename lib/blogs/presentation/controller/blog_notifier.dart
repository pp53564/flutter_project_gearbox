import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gearbox/blogs/domain/entity/blog.dart';
import 'package:gearbox/blogs/domain/usecase/blog_use_case.dart';

// class BlogNotifier extends Notifier<BlogState> {
//   late final BlogUseCase _usecase;
//
//   @override
//   BlogState build() {
//     _usecase = ref.watch(blogUseCaseProvider);
//     getTrendingBlogs(0, 3);
//     getLatestBlogs(0, 3);
//     return BlogStateLoading();
//   }
//
//   Future<void> getTrendingBlogs(int page, int size) async {
//     state = BlogStateLoading();
//     final result = await _usecase.getTrendingBlogs(page, size);
//     result.fold(
//       (failure) => state = BlogStateFailure(failure: failure),
//       (paginatedResponse) => state = BlogStateSuccess(
//           paginatedResponseTrending: paginatedResponse, paginatedResponseLatest: paginatedResponse),
//     );
//   }
//
//   Future<void> getLatestBlogs(int page, int size) async {
//     state = BlogStateLoading();
//     final result = await _usecase.getLatestBlogs(page, size);
//     result.fold(
//       (failure) => state = BlogStateFailure(failure: failure),
//       (paginatedResponse) => state = BlogStateSuccess(
//           paginatedResponseLatest: paginatedResponse, paginatedResponseTrending: paginatedResponse),
//     );
//   }
// }
class BlogNotifier
    extends StateNotifier<AsyncValue<({List<Blog> trendingBlogs, List<Blog> latestBlogs})>> {
  final BlogUseCase _usecase;
  List<Blog> trendingBlogs = [];
  List<Blog> latestBlogs = [];

  BlogNotifier(this._usecase) : super(const AsyncLoading()) {
    getBlogs(0, 3);
  }

  Future<void> getBlogs(int page, int size) async {
    state = const AsyncLoading();
    try {
      final resultTrendingBlogs = await _usecase.getTrendingBlogs(page, size);
      final resultLatestBlogs = await _usecase.getLatestBlogs(page, size);

      final trendingBlogs = resultTrendingBlogs.fold(
        (failure) => null,
        (blogs) => blogs,
      );

      final latestBlogs = resultLatestBlogs.fold(
        (failure) => null,
        (blogs) => blogs,
      );

      if (latestBlogs != null && trendingBlogs != null) {
        state = AsyncData((trendingBlogs: trendingBlogs.content, latestBlogs: latestBlogs.content));
      }
    } catch (e, stackTrace) {
      state = AsyncError(e, stackTrace);
    }
  }
}

// Future<void> getTrendingBlogs(int page, int size) async {
//   state = const AsyncLoading();
//   final result = await _usecase.getTrendingBlogs(page, size);
//
//   result.fold(
//     (failure) => state = AsyncError(failure, StackTrace.current),
//     (blogs) => state = AsyncData(blogs.content),
//   );
// }
//
// Future<void> getLatestBlogs(int page, int size) async {
//   state = const AsyncLoading();
//   final result = await _usecase.getLatestBlogs(page, size);
//
//   result.fold(
//     (failure) => state = AsyncError(failure, StackTrace.current),
//     (blogs) => state = AsyncData(blogs.content),
//   );
// }

// Future<void> getLatestBlogs() async {
//   final authRepository = ref.read(authRepositoryProvider);
//   state = const AsyncLoading();
//   state = await AsyncValue.guard(authRepository.signInAnonymously);
// }

// Future<void> getTrendingBlogs(int page, int size) async {
//   state = BlogStateLoading();
//   final result = await _usecase.getTrendingBlogs(page, size);
//   result.fold(
//     (failure) => state = BlogStateFailure(failure: failure),
//     (paginatedResponse) => state = BlogStateSuccess(
//         paginatedResponseTrending: paginatedResponse, paginatedResponseLatest: paginatedResponse),
//   );
// }
//
// Future<void> getLatestBlogs(int page, int size) async {
//   state = BlogStateLoading();
//   final result = await _usecase.getLatestBlogs(page, size);
//   result.fold(
//     (failure) => state = BlogStateFailure(failure: failure),
//     (paginatedResponse) => state = BlogStateSuccess(
//         paginatedResponseLatest: paginatedResponse, paginatedResponseTrending: paginatedResponse),
//   );
// }
