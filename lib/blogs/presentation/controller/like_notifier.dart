import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gearbox/blogs/domain/usecase/like_use_case.dart';
import 'package:gearbox/blogs/presentation/controller/state/like_state.dart';

// class LikeNotifier extends StateNotifier<AsyncValue<bool>> {
//   final LikeUseCase likeUseCase;
//
//   LikeNotifier(this.likeUseCase) : super(const AsyncValue.data(false));
//
//   Future<void> toggleLike(String blogId, String userId) async {
//     final previousIsLiked = state.value ?? false;
//     final newIsLiked = !previousIsLiked;
//
//     state = AsyncValue.data(newIsLiked);
//
//     try {
//       await likeUseCase.toggleLike(blogId, userId);
//     } catch (e, stackTrace) {
//       state = AsyncValue.error(e, stackTrace);
//     }
//   }
// }

class LikeNotifier extends StateNotifier<LikeState> {
  final LikeUseCase likeUseCase;
  bool _isLiked = false;

  LikeNotifier(this.likeUseCase) : super(LikeStateSuccess(isLiked: false)) {
    _initialize();
  }

  void _initialize() {
    state = LikeStateSuccess(isLiked: _isLiked);
  }

  Future<void> toggleLike(String blogId, String userId) async {
    state = LikeStateLoading();
    try {
      await likeUseCase.toggleLike(blogId, userId);
      _isLiked = !_isLiked;
      state = LikeStateSuccess(isLiked: _isLiked);
    } catch (e) {
      state = LikeStateFailure();
    }
  }
}
