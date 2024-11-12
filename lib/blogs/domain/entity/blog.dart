import 'package:gearbox/blogs/data/model/blog_category.dart';
import 'package:json_annotation/json_annotation.dart';

part 'blog.g.dart';

@JsonSerializable()
class Blog {
  final String id;
  final String title;
  final String content;
  final String thumbnailImageUrl;
  final String userId;
  final DateTime createDate;
  final int numberOfLikes;
  final BlogCategory category;

  Blog({
    required this.id,
    required this.title,
    required this.content,
    required this.thumbnailImageUrl,
    required this.userId,
    required this.createDate,
    required this.numberOfLikes,
    required this.category,
  });

  factory Blog.fromJson(Map<String, dynamic> json) => _$BlogFromJson(json);

  Map<String, dynamic> toJson() => _$BlogToJson(this);
}
