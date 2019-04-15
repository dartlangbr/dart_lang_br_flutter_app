
import 'package:dart_lang_br_flutter_app/repository/PostsRepository/model/Post.dart';
import 'package:flutter/material.dart';

class PostWidget extends StatelessWidget {

  final Post post;

  const PostWidget({Key key, this.post,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(post.title),
        ),
      ),
    );
  }
}
