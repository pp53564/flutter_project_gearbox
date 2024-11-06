import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gearbox/blogs/domain/usecase/blog_use_case.dart';
import 'package:gearbox/blogs/presentation/controller/state/blog_state.dart';
import 'package:gearbox/core/di.dart';

class BlogNotifier extends Notifier<BlogState> {
  late final BlogUseCase _usecase;

  @override
  BlogState build() {
    _usecase = ref.watch(blogUseCaseProvider);
    getTrendingBlogs(0, 3);
    getLatestBlogs(0, 3);
    return BlogStateLoading();
  }

  Future<void> getTrendingBlogs(int page, int size) async {
    state = BlogStateLoading();
    final result = await _usecase.getTrendingBlogs(page, size);
    result.fold(
      (failure) => state = BlogStateFailure(failure: failure),
      (paginatedResponse) => state = BlogStateSuccess(
          paginatedResponseTrending: paginatedResponse, paginatedResponseLatest: paginatedResponse),
    );
  }

  Future<void> getLatestBlogs(int page, int size) async {
    state = BlogStateLoading();
    final result = await _usecase.getLatestBlogs(page, size);
    result.fold(
      (failure) => state = BlogStateFailure(failure: failure),
      (paginatedResponse) => state = BlogStateSuccess(
          paginatedResponseLatest: paginatedResponse, paginatedResponseTrending: paginatedResponse),
    );
  }
}
