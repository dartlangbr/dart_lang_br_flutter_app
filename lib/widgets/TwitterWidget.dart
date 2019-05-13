import 'package:cached_network_image/cached_network_image.dart';
import 'package:dart_lang_br_flutter_app/repository/MetaDataRepository/model/UrlMetaData.dart';
import 'package:dart_lang_br_flutter_app/repository/TwitterRepository/model/TwitterModel.dart';
import 'package:dart_lang_br_flutter_app/support/Util.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'MySizeAnimated.dart';

class TwitterWidget extends StatelessWidget {

  final TwitterModel item;

  TwitterWidget({Key key, this.item}) : super(key: key);

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
                laucher("https://twitter.com/lang_dart/status/${item.id}");
              },
              child: MySizeAnimated(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      _buildHeader()
                    ],
                  ),
                ),
              ),
            )
        )
    );
  }

  _buildHeader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildImgProfile(),
        _buildContent(),
      ],
    );
  }

  _buildImgProfile() {
    return Container(
      height: 50,
      width: 50,
      padding: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
        border: Border.all(color: Colors.grey[300])
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
        child: CachedNetworkImage(
          imageUrl: item.user.profileImageUrl,
          placeholder: (context, url) => new CircularProgressIndicator(),
          errorWidget: (context, url, error) => new Icon(Icons.error),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  _buildContent() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  item.user.name,
                  style: TextStyle(
                      fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  "  @${item.user.screenName}",
                  style: TextStyle(
                      fontWeight: FontWeight.w300
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top:10.0,bottom: 10.0),
              child: Text(textWhitoutLink(item.text)),
            ),
            _buildDetailLink()
          ],
        ),
      ),
    );
  }

  _buildDetailLink() {

    if(item.metaData != null){

      UrlMetaData meta = item.metaData;

      if(meta.isEmpty()){
        return InkWell(
          onTap: (){
            laucher(meta.link);
          },
          child: Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                border: Border.all(color: Colors.grey[400])
            ),
            child: Text(meta.link),
          ),
        );
      }

      return Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: (){
            laucher(meta.link);
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                border: Border.all(color: Colors.grey[400])
            ),
            child: Column(
              children: <Widget>[
                _getImgMetadata(meta),
                Padding(
                  padding: const EdgeInsets.only(left:8.0,right: 8.0,top: 8.0),
                  child: Text(
                    meta.getTitte(),
                    maxLines: 1,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700]
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:8.0,right: 8.0,bottom: 8.0),
                  child: Text(
                    meta.getDescription(),
                    maxLines: 1,
                    style: TextStyle(
                        color: Colors.grey[700]
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

    }else{
      return Container();
    }

  }

  _getImgMetadata(UrlMetaData meta) {

    if(meta.getImg().isEmpty){
      return Container();
    }

    return Container(
      width: double.maxFinite,
      child: ClipRRect(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0),topRight: Radius.circular(10.0)),
        child: CachedNetworkImage(
          imageUrl: meta.getImg(),
          placeholder: (context, url) => new CircularProgressIndicator(),
          errorWidget: (context, url, error) => new Icon(Icons.error),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  void laucher(String link) async {

    if (await canLaunch(link)) {
      await launch(link);
    } else {
      print('Could not launch $link');
    }

  }

  String textWhitoutLink(String text) {

    var link =  getFisrtLinkInText(text);

    return text.replaceAll(link,"").replaceAll("\n", "");
  }
}
