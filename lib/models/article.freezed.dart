// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'article.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Article _$ArticleFromJson(Map<String, dynamic> json) {
  return _Article.fromJson(json);
}

/// @nodoc
mixin _$Article {
  @JsonKey(name: r"$id")
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  int get publishDate => throw _privateConstructorUsedError;
  int? get lastModifyDate => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get categoryId => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  int get viewCount => throw _privateConstructorUsedError;
  int get likeCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArticleCopyWith<Article> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArticleCopyWith<$Res> {
  factory $ArticleCopyWith(Article value, $Res Function(Article) then) =
      _$ArticleCopyWithImpl<$Res, Article>;
  @useResult
  $Res call(
      {@JsonKey(name: r"$id") String id,
      String userId,
      int publishDate,
      int? lastModifyDate,
      String title,
      String categoryId,
      String content,
      int viewCount,
      int likeCount});
}

/// @nodoc
class _$ArticleCopyWithImpl<$Res, $Val extends Article>
    implements $ArticleCopyWith<$Res> {
  _$ArticleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? publishDate = null,
    Object? lastModifyDate = freezed,
    Object? title = null,
    Object? categoryId = null,
    Object? content = null,
    Object? viewCount = null,
    Object? likeCount = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      publishDate: null == publishDate
          ? _value.publishDate
          : publishDate // ignore: cast_nullable_to_non_nullable
              as int,
      lastModifyDate: freezed == lastModifyDate
          ? _value.lastModifyDate
          : lastModifyDate // ignore: cast_nullable_to_non_nullable
              as int?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      viewCount: null == viewCount
          ? _value.viewCount
          : viewCount // ignore: cast_nullable_to_non_nullable
              as int,
      likeCount: null == likeCount
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ArticleCopyWith<$Res> implements $ArticleCopyWith<$Res> {
  factory _$$_ArticleCopyWith(
          _$_Article value, $Res Function(_$_Article) then) =
      __$$_ArticleCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: r"$id") String id,
      String userId,
      int publishDate,
      int? lastModifyDate,
      String title,
      String categoryId,
      String content,
      int viewCount,
      int likeCount});
}

/// @nodoc
class __$$_ArticleCopyWithImpl<$Res>
    extends _$ArticleCopyWithImpl<$Res, _$_Article>
    implements _$$_ArticleCopyWith<$Res> {
  __$$_ArticleCopyWithImpl(_$_Article _value, $Res Function(_$_Article) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? publishDate = null,
    Object? lastModifyDate = freezed,
    Object? title = null,
    Object? categoryId = null,
    Object? content = null,
    Object? viewCount = null,
    Object? likeCount = null,
  }) {
    return _then(_$_Article(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      publishDate: null == publishDate
          ? _value.publishDate
          : publishDate // ignore: cast_nullable_to_non_nullable
              as int,
      lastModifyDate: freezed == lastModifyDate
          ? _value.lastModifyDate
          : lastModifyDate // ignore: cast_nullable_to_non_nullable
              as int?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      viewCount: null == viewCount
          ? _value.viewCount
          : viewCount // ignore: cast_nullable_to_non_nullable
              as int,
      likeCount: null == likeCount
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Article with DiagnosticableTreeMixin implements _Article {
  const _$_Article(
      {@JsonKey(name: r"$id") required this.id,
      required this.userId,
      required this.publishDate,
      this.lastModifyDate,
      required this.title,
      required this.categoryId,
      required this.content,
      this.viewCount = 0,
      this.likeCount = 0});

  factory _$_Article.fromJson(Map<String, dynamic> json) =>
      _$$_ArticleFromJson(json);

  @override
  @JsonKey(name: r"$id")
  final String id;
  @override
  final String userId;
  @override
  final int publishDate;
  @override
  final int? lastModifyDate;
  @override
  final String title;
  @override
  final String categoryId;
  @override
  final String content;
  @override
  @JsonKey()
  final int viewCount;
  @override
  @JsonKey()
  final int likeCount;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Article(id: $id, userId: $userId, publishDate: $publishDate, lastModifyDate: $lastModifyDate, title: $title, categoryId: $categoryId, content: $content, viewCount: $viewCount, likeCount: $likeCount)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Article'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('userId', userId))
      ..add(DiagnosticsProperty('publishDate', publishDate))
      ..add(DiagnosticsProperty('lastModifyDate', lastModifyDate))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('categoryId', categoryId))
      ..add(DiagnosticsProperty('content', content))
      ..add(DiagnosticsProperty('viewCount', viewCount))
      ..add(DiagnosticsProperty('likeCount', likeCount));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Article &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.publishDate, publishDate) ||
                other.publishDate == publishDate) &&
            (identical(other.lastModifyDate, lastModifyDate) ||
                other.lastModifyDate == lastModifyDate) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.viewCount, viewCount) ||
                other.viewCount == viewCount) &&
            (identical(other.likeCount, likeCount) ||
                other.likeCount == likeCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, publishDate,
      lastModifyDate, title, categoryId, content, viewCount, likeCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ArticleCopyWith<_$_Article> get copyWith =>
      __$$_ArticleCopyWithImpl<_$_Article>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ArticleToJson(
      this,
    );
  }
}

abstract class _Article implements Article {
  const factory _Article(
      {@JsonKey(name: r"$id") required final String id,
      required final String userId,
      required final int publishDate,
      final int? lastModifyDate,
      required final String title,
      required final String categoryId,
      required final String content,
      final int viewCount,
      final int likeCount}) = _$_Article;

  factory _Article.fromJson(Map<String, dynamic> json) = _$_Article.fromJson;

  @override
  @JsonKey(name: r"$id")
  String get id;
  @override
  String get userId;
  @override
  int get publishDate;
  @override
  int? get lastModifyDate;
  @override
  String get title;
  @override
  String get categoryId;
  @override
  String get content;
  @override
  int get viewCount;
  @override
  int get likeCount;
  @override
  @JsonKey(ignore: true)
  _$$_ArticleCopyWith<_$_Article> get copyWith =>
      throw _privateConstructorUsedError;
}
