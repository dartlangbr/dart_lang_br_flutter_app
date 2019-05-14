import 'package:cached_network_image/cached_network_image.dart';
import 'package:dart_lang_br_flutter_app/support/Util.dart';
import 'package:dart_lang_br_flutter_app/support/youtube_api/youtube_api.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class YoutubeWidget extends StatelessWidget {

  final YT_API item;

  const YoutubeWidget({Key key, this.item}) : super(key: key);

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
            _goYoutube(item.url);
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _buildImg(),
              _buildContent(),
            ],
          ),
        ),
      ),
    );

  }

  _buildImg() {
    return ClipRRect(
      borderRadius: BorderRadius.only(topRight: Radius.circular(10.0),topLeft: Radius.circular(10.0)),
      child: Container(
        child: CachedNetworkImage(
          imageUrl: item.thumbnail['high']['url'],
          placeholder: (context, url) => new CircularProgressIndicator(),
          errorWidget: (context, url, error) => new Icon(Icons.error),
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }

  _buildContent() {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
              item.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0
            ),
          ),
          Text(
            dateTransformZ(item.publishedAt),
            style: TextStyle(
              color: Colors.grey
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:8.0),
            child: Text(item.description),
          ),
        ],
      ),
    );
  }

  void _goYoutube(String link) async {
    if (await canLaunch(link)) {
    await launch(link);
    } else {
    print('Could not launch $link');
    }
  }

}
