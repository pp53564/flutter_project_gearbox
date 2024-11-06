import 'package:dartz/dartz.dart';
import 'package:gearbox/blogs/domain/entity/paginated_response.dart';
import 'package:gearbox/blogs/domain/repository/blog_repository.dart';
import 'package:gearbox/core/failure.dart';

class BlogUseCase {
  final BlogRepository blogRepository;

  BlogUseCase(this.blogRepository);

  Future<Either<Failure, PaginatedResponse>> getTrendingBlogs(int page, int size) {
    return blogRepository.getTrendingBlogs(page, size);
  }

  Future<Either<Failure, PaginatedResponse>> getLatestBlogs(int page, int size) {
    return blogRepository.getLatestBlogs(page, size);
  }
}
