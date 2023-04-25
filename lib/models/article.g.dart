// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Article _$$_ArticleFromJson(Map<String, dynamic> json) => _$_Article(
      id: json[r'$id'] as String,
      userId: json['userId'] as String,
      publishDate: json['publishDate'] as int,
      lastModifyDate: json['lastModifyDate'] as int?,
      title: json['title'] as String,
      cover: json['cover'] as String?,
      desc: json['desc'] as String?,
      categoryId: json['categoryId'] as String,
      content: json['content'] as String,
      viewCount: json['viewCount'] as int? ?? 0,
      likeCount: json['likeCount'] as int? ?? 0,
    );

Map<String, dynamic> _$$_ArticleToJson(_$_Article instance) =>
    <String, dynamic>{
      r'$id': instance.id,
      'userId': instance.userId,
      'publishDate': instance.publishDate,
      'lastModifyDate': instance.lastModifyDate,
      'title': instance.title,
      'cover': instance.cover,
      'desc': instance.desc,
      'categoryId': instance.categoryId,
      'content': instance.content,
      'viewCount': instance.viewCount,
      'likeCount': instance.likeCount,
    };
