import 'package:dart_lang_br_flutter_app/repository/PostsRepository/model/Post.dart';
import 'package:dart_lang_br_flutter_app/support/Util.dart';
import 'package:flutter/material.dart';

class DetailView extends StatelessWidget {

  final Post post;

  const DetailView({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 100,
        child: ImgHeroFromNetwork(
            post.imgAuthor,
           tagHero: "avatar${post.id}"
        ),
      ),
    );

  }
}
