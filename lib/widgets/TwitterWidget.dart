import 'package:cached_network_image/cached_network_image.dart';
import 'package:dart_lang_br_flutter_app/repository/TwitterRepository/model/TwitterModel.dart';
import 'package:flutter/material.dart';

class TwitterWidget extends StatelessWidget {

  final TwitterModel item;

  const TwitterWidget({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
    if(item.text.contains("http")){
      return InkWell(
        onTap: (){

        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              border: Border.all(color: Colors.grey[300])
          ),
          child: Column(
            children: <Widget>[
              Text("fdfd")
            ],
          ),
        ),
      );
    }else{
      return Container();
    }
  }
}
