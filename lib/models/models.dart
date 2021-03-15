import 'package:web_demo/core/util/value_util.dart';
import 'package:web_demo/core/util/date_util.dart';

abstract class BaseModel {}

class Article extends BaseModel {
  String id;
  String userId;
  int publishDate;
  int lastModifyDate;
  String title;
  Category category;

  int viewCount;
  int likeCount;

  String get showDate => DateUtil.readTimestamp(publishDate);

  Article.fromMap(Map json) {
    id = ValueUtil.toStr(json['_id']);
    userId = ValueUtil.toStr(json['user_id']);
    publishDate = ValueUtil.toInt(json['publish_date']);
    lastModifyDate = ValueUtil.toInt(json['last_modify_date']);
    title = ValueUtil.toStr(json['title']);
    category = Category.fromMap(ValueUtil.toMap(json['category']));
    viewCount = ValueUtil.toInt(json['view_count']);
    likeCount = ValueUtil.toInt(json['like_count']);
  }
}

class Category extends BaseModel {
  String id;
  String name;

  Category.fromMap(Map json) {
    id = ValueUtil.toStr(json['_id']);
    name = ValueUtil.toStr(json['name']);
  }
}
