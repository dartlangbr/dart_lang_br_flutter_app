import 'package:dart_lang_br_flutter_app/repository/PostsRepository/model/Post.dart';
import 'package:dart_lang_br_flutter_app/support/Util.dart';
import 'package:flutter/material.dart';
import 'package:page_view_indicator/page_view_indicator.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DetailView extends StatefulWidget {

  final Post post;

  DetailView({Key key, this.post}) : super(key: key);

  @override
  _DetailViewState createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {

  final pageIndexNotifier = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _buildBody(context),
    );

  }

  _buildBody(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(10.0),
          child: Material(
            color: Colors.white,
            elevation: 3.0,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildImg(context),
                _buildAuthor(),
                _buildTitle(),
                _buildCat(),
                _buildContent(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  _buildImg(BuildContext context) {

    if(widget.post.category.where((i) => i == "Video").length > 0){

      var description = widget.post.content.replaceAll("\n", "");
      var videoId = YoutubePlayer.convertUrlToId(description);

      return YoutubePlayer(
        context: context,
        videoId: videoId,
        autoPlay: true,
        showVideoProgressIndicator: true,
        videoProgressIndicatorColor: Colors.amber,
        progressColors: ProgressColors(
          playedColor: Colors.amber,
          handleColor: Colors.amberAccent,
        ),
        onPlayerInitialized: (controller) {

        },
      );
    }

    if(widget.post.attachments.length > 0){
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: 200.0,
            child: PageView.builder(
                onPageChanged: (index) => pageIndexNotifier.value = index,
                itemCount: widget.post.attachments.length,
                itemBuilder: (_,index){
                  return ClipRRect(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0),topRight: Radius.circular(10.0)),
                    child: Container(
                      height: 200.0,
                      width: double.maxFinite,
                      child: ImgHeroFromNetwork(
                          widget.post.attachments[index],
                          tagHero: "attachment${widget.post.id}"
                      ),
                    ),
                  );
                }
            ),
          ),
          _buildPageIndicator(),
        ],
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
            widget.post.imgAuthor,
            tagHero: "avatar${widget.post.id}"
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
              widget.post.author,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800]
              ),
            ),
            Text(
              dateTransform(widget.post.date),
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

  _buildContent() {
    String content = widget.post.content.replaceAll("\n\n\n\n\n", "");
    content = content.replaceAll("\n\n\n\n", "\n\n");
    content = content.replaceAll("\n\n\n", "\n\n");

    if(widget.post.category.where((i) => i == "Video").length > 0){
      content = "";
    }

    return Container(
      margin: EdgeInsets.all(15.0),
      child: Text(content),
    );
  }

  _buildTitle() {
    return Padding(
      padding: EdgeInsets.only(left: 15.0, right: 15.0,top: 15.0),
      child: Text(
        widget.post.title,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0
        ),
      ),
    );
  }

  _buildCat() {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
      child: Row(
        children: _generateCat(),
      ),
    );
  }

  _generateCat(){
    return widget.post.category.map<Widget>((cat){
      return Container(
        margin: EdgeInsets.only(right: 5.0,top: 5.0),
        padding: EdgeInsets.only(left: 10.0,right: 10.0,top: 5.0,bottom: 5.0),
        decoration: BoxDecoration(
            color: Colors.lightBlue,
            borderRadius: BorderRadius.all(Radius.circular(20.0))
        ),
        child: Text(
          cat,
          style: TextStyle(
              color: Colors.white
          ),
        ),
      );
    }).toList();
  }

  PageViewIndicator _buildPageIndicator() {
    return PageViewIndicator(
      pageIndexNotifier: pageIndexNotifier,
      length: widget.post.attachments.length,
      normalBuilder: (animationController, index) => Circle(
        size: 8.0,
        color: Colors.grey[600],
      ),
      highlightedBuilder: (animationController, index) => ScaleTransition(
        scale: CurvedAnimation(
          parent: animationController,
          curve: Curves.ease,
        ),
        child: Circle(
          size: 12.0,
          color: Colors.blue,
        ),
      ),
    );
  }

}
