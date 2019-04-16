import 'package:dart_lang_br_flutter_app/repository/PostsRepository/model/Post.dart';
import 'package:dart_lang_br_flutter_app/support/Util.dart';
import 'package:flutter/material.dart';

class DetailView extends StatelessWidget {

  final Post post;

  const DetailView({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _buildBody(),
    );

  }

  _buildBody() {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Material(
        color: Colors.white,
        elevation: 3.0,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        child: ListView(
          children: <Widget>[
            _buildContent(),
            _buildAuthor()
          ],
        ),
      ),
    );
  }

  _buildContent() {
    if(post.attachments.length > 0){
      return ClipRRect(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0),topRight: Radius.circular(10.0)),
        child: Container(
          height: 200.0,
          width: double.maxFinite,
          child: ImgHeroFromNetwork(
              post.attachments[0],
              tagHero: "attachment${post.id}"
          ),
        ),
      );
    }else{
      return Container();
    }
  }

  _buildAuthor() {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        padding: EdgeInsets.all(15.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildImgAuthor(),
            _buildNameAuthor()
          ],
        ),
      ),
    );
  }

  _buildImgAuthor() {
    return Container(
      width: 50.0,
      height: 50.0,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        child: ImgHeroFromNetwork(
            post.imgAuthor,
            tagHero: "avatar${post.id}"
        ),
      ),
    );
  }

  _buildNameAuthor() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(left: 10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              post.author,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800]
              ),
            ),
            Text(
              dateTransform(post.date),
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14.0
              ),
            )
          ],
        ),
      ),
    );
  }

}
