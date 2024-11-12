import 'package:dartz/dartz.dart';
import 'package:gearbox/blogs/domain/repository/blog_repository.dart';
import 'package:gearbox/core/failure.dart';

class LikeUseCase {
  final BlogRepository blogRepository;

  LikeUseCase(this.blogRepository);

  Future<Either<Failure, void>> toggleLike(String blogId, String userId) async {
    return blogRepository.toggleLike(blogId, userId);
  }
}
