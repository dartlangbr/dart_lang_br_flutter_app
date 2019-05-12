

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

RichText detectLinkInText(String text){

  List<TextSpan> textSpanList = List();
  String textBuilder = text;

  while(textBuilder.contains("http")){

    var startIndex = textBuilder.indexOf("http");
    var endIndex = textBuilder.substring(startIndex).indexOf(" ");
    var endLink = startIndex + endIndex;

    textSpanList.add(buildTextSpan(textBuilder.substring(0,startIndex)));

    if(startIndex > -1 && endIndex > -1) {
      textSpanList.add(buildTextSpanLink(textBuilder.substring(startIndex,endLink)));
    }

    textBuilder = textBuilder.substring(endLink);

  }

  return RichText(
    text: TextSpan(
      children: textSpanList,
    )
  );

}

TextSpan buildTextSpan(String text){
  return TextSpan(
    text: text,
    style: new TextStyle(color: Colors.black),
  );
}

TextSpan buildTextSpanLink(String text){
  return TextSpan(
    text: text,
    style: TextStyle(color: Colors.blue),
    recognizer: TapGestureRecognizer()
      ..onTap = () { launch(text);
      },
  );
}

void launch(String s) {

}