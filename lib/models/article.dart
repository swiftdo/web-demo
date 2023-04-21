import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'article.freezed.dart';
part 'article.g.dart';

@freezed
class Article with _$Article {
  const factory Article({
    @JsonKey(name: r"$id") required String id,
    required String userId,
    required int publishDate,
    int? lastModifyDate,
    required String title,
    required String categoryId,
    required String content,
    @Default(0) int viewCount,
    @Default(0) int likeCount,
  }) = _Article;



  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);
}