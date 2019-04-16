
import 'package:dart_lang_br_flutter_app/repository/PostsRepository/model/Post.dart';
import 'package:dart_lang_br_flutter_app/support/Util.dart';
import 'package:flutter/material.dart';

class PostWidget extends StatelessWidget {

  final Post post;

  const PostWidget({Key key, this.post,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        elevation: 2.0,
        child: InkWell(
          onTap: (){

          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildImg(),
              _buildContent(),
              _buildTitle(),
              _buildDescription()
            ],
          ),
        ),
      ),
    );
  }

  _buildImg() {
    if(post.attachments.length > 0){
      return ClipRRect(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0),topRight: Radius.circular(10.0)),
        child: Container(
          height: 150.0,
          width: double.maxFinite,
          child: ImgFromNetwork(
              post.attachments[0]
          ),
        ),
      );
    }else{
      return Container();
    }
  }

  _buildContent() {
    return Container(
      padding: EdgeInsets.all(15.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildImgAuthor(),
          _buildNameAuthor()
        ],
      ),
    );
  }

  _buildImgAuthor() {
    return Container(
      width: 50.0,
      height: 50.0,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        child: ImgFromNetwork(post.imgAuthor),
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

  _buildDescription() {

    String description = post.content.replaceAll("\n", "");
    if(description.length >= 120){
      description = "${description.substring(0,120)}...";
    }
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Text(
        description,
        maxLines: 3,
      ),
    );
  }

  _buildTitle() {
    return Padding(
      padding: EdgeInsets.only(left: 15.0, right: 15.0),
      child: Text(
          post.title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 17.0
        ),
      ),
    );
  }
}
