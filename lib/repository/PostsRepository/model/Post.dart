import 'package:dart_lang_br_flutter_app/repository/PostsRepository/model/Comment.dart';

class Post {
  String id;
  String date;
  String title;
  String content;
  String author;
  String imgAuthor;
  List<String> category;
  List<Comment> comment;
  List<String> attachments;

  Post(
      {this.id,
        this.date,
        this.title,
        this.content,
        this.author,
        this.imgAuthor,
        this.category,
        this.comment,
        this.attachments});

  Post.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    title = json['title'];
    content = json['content'];
    author = json['author'];
    imgAuthor = json['img_author'];
    category = json['category'].cast<String>();
    if (json['comment'] != null) {
      comment = new List<Comment>();
      json['comment'].forEach((v) {
        comment.add(new Comment.fromJson(v));
      });
    }
    attachments = json['attachments'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['title'] = this.title;
    data['content'] = this.content;
    data['author'] = this.author;
    data['img_author'] = this.imgAuthor;
    data['category'] = this.category;
    if (this.comment != null) {
      data['comment'] = this.comment.map((v) => v.toJson()).toList();
    }
    data['attachments'] = this.attachments;
    return data;
  }
}