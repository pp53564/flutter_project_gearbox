import 'package:gearbox/core/failure.dart';

sealed class LikeState {}

class LikeStateSuccess extends LikeState {
  final bool isLiked;

  LikeStateSuccess({required this.isLiked});
}

class LikeStateFailure extends LikeState {
  final Failure? failure;

  LikeStateFailure({this.failure});
}

class LikeStateLoading extends LikeState {}
