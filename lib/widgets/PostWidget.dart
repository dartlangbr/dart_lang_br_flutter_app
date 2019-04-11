
import 'package:flutter/material.dart';
import 'package:flutter_wordpress/flutter_wordpress.dart';

class PostWidget extends StatelessWidget {

  final Post post;

  const PostWidget({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(post.title.rendered),
        ),
      ),
    );
  }
}
