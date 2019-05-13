import 'package:bsev/stream_create.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dart_lang_br_flutter_app/repository/MetaDataRepository/MetaDataRepository.dart';
import 'package:dart_lang_br_flutter_app/repository/MetaDataRepository/model/UrlMetaData.dart';
import 'package:dart_lang_br_flutter_app/repository/TwitterRepository/model/TwitterModel.dart';
import 'package:flutter/material.dart';
import 'package:injector/injector.dart';

class TwitterWidget extends StatelessWidget {

  final TwitterModel item;

  TwitterWidget({Key key, this.item}) : super(key: key);

  var metadata = BehaviorSubjectCreate<UrlMetaData>();

  @override
  Widget build(BuildContext context) {

    verifyMetadata();

    return Container(
        margin: EdgeInsets.all(10.0),
        child: Material(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            elevation: 2.0,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  _buildHeader()
                ],
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
              child: Text(item.text),
            ),
            _buildDetailLink()
          ],
        ),
      ),
    );
  }

  _buildDetailLink() {

    return StreamBuilder(
      stream: metadata.get,
      builder: (context,snapshot){

        if(snapshot.hasData){

          UrlMetaData meta = snapshot.data;

          return Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: (){

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
      },
    );
  }

  void verifyMetadata() {

    if(metadata.value == null){
      if(item.text.contains("http")){
        MetaDataRepository repo = Injector.appInstance.getDependency();
        var link = getLinkInImgTag(item.text);

        repo.getMetadata(link).then((m){
          var ma = m;
          ma.link = link;
          metadata.set(ma);
        }).catchError((error){
          print(error);
        });
      }
    }


  }

  String getLinkInImgTag(String tagImg) {

    var tagImgstartIndex = tagImg.indexOf("http");
    var tagImgendIndex = tagImg.substring(tagImgstartIndex).indexOf(" ");
    var tagImgendLink = tagImg.length;
    if(tagImgendIndex > -1){
      tagImgendLink = tagImgstartIndex + tagImgendIndex;
    }

    return tagImg.substring(tagImgstartIndex,tagImgendLink);
  }

  _getImgMetadata(UrlMetaData meta) {

    if(meta.getImg().isEmpty){
      return Container();
    }

    return Container(
      width: double.maxFinite,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        child: CachedNetworkImage(
          imageUrl: meta.getImg(),
          placeholder: (context, url) => new CircularProgressIndicator(),
          errorWidget: (context, url, error) => new Icon(Icons.error),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
