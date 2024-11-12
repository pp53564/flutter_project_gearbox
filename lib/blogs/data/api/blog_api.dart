import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:gearbox/blogs/data/model/like_request.dart';
import 'package:gearbox/blogs/domain/entity/paginated_response.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'blog_api.g.dart';

@RestApi(baseUrl: 'http://10.0.2.2:8080/api/blog')
abstract class BlogApi {
  factory BlogApi(Dio dio, {String baseUrl}) = _BlogApi;

  @GET('/trending/{page}/{size}')
  Future<PaginatedResponse> getTrendingBlogs(
    @Path('page') int page,
    @Path('size') int size,
  );

  @GET('/latest/{page}/{size}')
  Future<PaginatedResponse> getLatestBlogs(
    @Path('page') int page,
    @Path('size') int size,
  );

  @POST('/toggleLike')
  Future<void> toggleLike(@Body() LikeRequest request);
}
