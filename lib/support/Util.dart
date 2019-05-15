

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

Widget ImgHeroFromNetwork(String url, {BoxFit fit = BoxFit.cover, String tagHero = ""}){

 return Hero(
   tag: tagHero,
   child: CachedNetworkImage(
      imageUrl: url,
      placeholder: (context, url) => new CircularProgressIndicator(),
      errorWidget: (context, url, error) => new Icon(Icons.error),
      fit: fit,
    ),
 );

}

String dateTransform(String date){
  List<String> s = date.split(" ");
  s = s[0].split("-");
  var m = "";
  switch(s[1]){
    case "01":m = "Jan"; break;
    case "02":m = "Fev"; break;
    case "03":m = "Mar"; break;
    case "04":m = "Abr"; break;
    case "05":m = "Mai"; break;
    case "06":m = "Jun"; break;
    case "07":m = "Jul"; break;
    case "08":m = "Ago"; break;
    case "09":m = "Set"; break;
    case "10":m = "Out"; break;
    case "11":m = "Nov"; break;
    case "12":m = "Dez"; break;
  }
  return "$m ${s[2]}, ${s[0]}";
}


String dateTransformZ(String date){
  List<String> s = date.split("T");
  s = s[0].split("-");
  var m = "";
  switch(s[1]){
    case "01":m = "Jan"; break;
    case "02":m = "Fev"; break;
    case "03":m = "Mar"; break;
    case "04":m = "Abr"; break;
    case "05":m = "Mai"; break;
    case "06":m = "Jun"; break;
    case "07":m = "Jul"; break;
    case "08":m = "Ago"; break;
    case "09":m = "Set"; break;
    case "10":m = "Out"; break;
    case "11":m = "Nov"; break;
    case "12":m = "Dez"; break;
  }
  return "$m ${s[2]}, ${s[0]}";
}

String getFisrtLinkInText(String tagImg) {

  var tagImgstartIndex = tagImg.indexOf("http");
  var tagImgendIndex = tagImg.substring(tagImgstartIndex).indexOf(" ");
  var tagImgendLink = tagImg.length;
  if(tagImgendIndex > -1){
    tagImgendLink = tagImgstartIndex + tagImgendIndex;
  }

  return tagImg.substring(tagImgstartIndex,tagImgendLink);
}

Color ColorFromHex({String code}) {
  var str = code.substring(1, 7);
  var bigint = int.parse(str, radix: 16);
  final r = (bigint >> 16) & 255;
  final g = (bigint >> 8) & 255;
  final b = bigint & 255;
  final a = 255;
  return Color.fromARGB(a, r, g, b);
}

Widget buildLayoutTryAgain(Function tryAgain){
  return Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Opacity(
          opacity: 0.6,
            child: Image.asset(
                'assets/logo_grey.png',
              width: 100.0,
              height: 100.0,
            )
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
              "Ocorreu algum problema :-(",
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 18.0
            ),
          ),
        ),
        RaisedButton(
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0),
          ),
          color: Colors.blue,
          child: Text(
              "Tentar novamente",
            style: TextStyle(
              color: Colors.white
            ),
          ),
            onPressed: tryAgain
        )
      ],
    ),
  );
}