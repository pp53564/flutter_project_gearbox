import 'package:dartz/dartz.dart';
import 'package:gearbox/blogs/domain/entity/paginated_response.dart';
import 'package:gearbox/core/failure.dart';

abstract interface class BlogRepository {
  Future<Either<Failure, PaginatedResponse>> getTrendingBlogs(final int page, final int size);

  Future<Either<Failure, PaginatedResponse>> getLatestBlogs(final int page, final int size);

  Future<Either<Failure, Unit>> toggleLike(String blogId, String userId);
}
