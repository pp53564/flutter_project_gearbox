import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gearbox/blogs/domain/entity/blog.dart';
import 'package:gearbox/blogs/domain/usecase/blog_use_case.dart';
import 'package:gearbox/blogs/presentation/controller/state/blog_state.dart';
import 'package:gearbox/core/di.dart';
import 'package:riverpod_infinite_scroll/riverpod_infinite_scroll.dart';

class BlogLatestNotifier extends Notifier<BlogState> {
  late final BlogUseCase _usecase;
  bool _last = false;
  int _currentPage = 0;

  @override
  BlogState build() {
    _usecase = ref.watch(blogUseCaseProvider);
    getLatestBlogs(0, 6);
    return BlogStateLoading();
  }

  Future<void> getLatestBlogs(int page, int size) async {
    state = BlogStateLoading();
    final result = await _usecase.getLatestBlogs(_currentPage, size);
    result.fold(
      (failure) => state = BlogStateFailure(failure: failure),
      (paginatedResponse) {
        _last = paginatedResponse.last;
        state = BlogStateSuccess(
            paginatedResponseLatest: paginatedResponse,
            paginatedResponseTrending: paginatedResponse);
        if (!_last) {
          _currentPage++;
        }
      },
    );
  }
}

class BlogListPaginationNotifier extends PagedNotifier<int, Blog> {
  final BlogUseCase _useCase;

  BlogListPaginationNotifier(this._useCase)
      : super(
          load: (page, limit) async {
            print('${page} + ${limit}');
            final result = await _useCase.getLatestBlogs(page, limit);
            return result.fold((failure) => throw new Exception(failure),
                (paginatedResponse) => paginatedResponse.content);
          },
          nextPageKeyBuilder: NextPageKeyBuilderDefault.mysqlPagination,
        );
}

final blogListPaginationProvider =
    StateNotifierProvider<BlogListPaginationNotifier, PagedState<int, Blog>>(
        (ref) => BlogListPaginationNotifier(ref.read(blogUseCaseProvider)));
