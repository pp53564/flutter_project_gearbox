import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:gearbox/blogs/data/api/blog_api.dart';
import 'package:gearbox/blogs/data/model/like_request.dart';
import 'package:gearbox/blogs/domain/entity/paginated_response.dart';
import 'package:gearbox/blogs/domain/repository/blog_repository.dart';
import 'package:gearbox/core/failure.dart';

class BlogRepositoryImpl implements BlogRepository {
  final BlogApi _blogApi;

  BlogRepositoryImpl(this._blogApi);

  @override
  Future<Either<Failure, PaginatedResponse>> getTrendingBlogs(int page, int size) async {
    try {
      final response = await _blogApi.getTrendingBlogs(page, size);
      return Right(response);
    } on DioException catch (error) {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, PaginatedResponse>> getLatestBlogs(int page, int size) async {
    try {
      final response = await _blogApi.getLatestBlogs(page, size);
      return Right(response);
    } on DioException catch (error) {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> toggleLike(String blogId, String userId) async {
    try {
      final request = LikeRequest(
        blogId: blogId,
        userId: userId,
      );
      await _blogApi.toggleLike(request);
      return const Right(unit);
    } on DioException catch (error) {
      return Left(NetworkFailure());
    }
  }
}
