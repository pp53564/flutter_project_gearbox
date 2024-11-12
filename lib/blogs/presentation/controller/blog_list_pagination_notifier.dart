import 'package:gearbox/blogs/domain/entity/blog.dart';
import 'package:gearbox/blogs/domain/usecase/blog_use_case.dart';
import 'package:riverpod_infinite_scroll/riverpod_infinite_scroll.dart';

class BlogListPaginationNotifier extends PagedNotifier<int, Blog> {
  final BlogUseCase _useCase;

  BlogListPaginationNotifier(this._useCase)
      : super(
          load: (page, limit) async {
            final result = await _useCase.getLatestBlogs(page, limit);
            return result.fold((failure) => throw 'Something went wrong...',
                (paginatedResponse) => paginatedResponse.content);
          },
          nextPageKeyBuilder: NextPageKeyBuilderDefault.mysqlPagination,
        );
}
