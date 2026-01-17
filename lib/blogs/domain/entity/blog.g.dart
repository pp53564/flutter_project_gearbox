// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Blog _$BlogFromJson(Map<String, dynamic> json) => Blog(
      id: json['id'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
      thumbnailImageUrl: json['thumbnailImageUrl'] as String,
      userId: json['userId'] as String,
      createDate: DateTime.parse(json['createDate'] as String),
      numberOfLikes: (json['numberOfLikes'] as num).toInt(),
      category: $enumDecode(_$BlogCategoryEnumMap, json['category']),
    );

Map<String, dynamic> _$BlogToJson(Blog instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'thumbnailImageUrl': instance.thumbnailImageUrl,
      'userId': instance.userId,
      'createDate': instance.createDate.toIso8601String(),
      'numberOfLikes': instance.numberOfLikes,
      'category': _$BlogCategoryEnumMap[instance.category]!,
    };

const _$BlogCategoryEnumMap = {
  BlogCategory.TECHNOLOGY: 'TECHNOLOGY',
  BlogCategory.HOT_NEWS: 'HOT_NEWS',
  BlogCategory.CONCEPTS: 'CONCEPTS',
  BlogCategory.ELECTRIC_CARS: 'ELECTRIC_CARS',
  BlogCategory.EXOTIC: 'EXOTIC',
  BlogCategory.OLDTIMER: 'OLDTIMER',
};
