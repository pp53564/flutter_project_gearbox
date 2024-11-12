import 'package:gearbox/blogs/domain/entity/paginated_response.dart';
import 'package:gearbox/core/failure.dart';

sealed class BlogState {}

class BlogStateSuccess extends BlogState {
  final PaginatedResponse paginatedResponseTrending;
  final PaginatedResponse paginatedResponseLatest;

  BlogStateSuccess(
      {required this.paginatedResponseTrending, required this.paginatedResponseLatest});
}

class BlogStateFailure extends BlogState {
  final Failure? failure;

  BlogStateFailure({this.failure});
}

class BlogStateLoading extends BlogState {}
