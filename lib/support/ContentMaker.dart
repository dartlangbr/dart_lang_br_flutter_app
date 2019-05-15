
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Util.dart';

class ContentMaker{

  final String text;
  final Function(String) clickLink;
  final Function(String) clickImg;

  ContentMaker(this.text, this.clickLink, this.clickImg);

  List<Widget> make(){
   return _detectImgInText(text);
  }

  List<Widget> _detectImgInText(String text){

    List<Widget> widgetList = List();

    String textBuilder = text;

    while(textBuilder.contains("<img")){

      var startIndex = textBuilder.indexOf("<img");
      var endIndex = textBuilder.substring(startIndex).indexOf("/>") + 2;
      var endLink = startIndex + endIndex;

      if(startIndex != 0)
        widgetList.add(detectLinkInText(textBuilder.substring(0,startIndex)));

      if(startIndex > -1 && endIndex > -1) {

        var tagImg = textBuilder.substring(startIndex,endLink);
        var link = getLinkInImgTag(tagImg);
        widgetList.add(InkWell(
          onTap: (){
            clickImg(link);
          },
          child: Padding(
            padding: const EdgeInsets.only(left:15.0,right: 15.0),
            child: ImgHeroFromNetwork(link,tagHero: link),
          ),
        ));

      }

      textBuilder = textBuilder.substring(endLink);

    }

    if(textBuilder.length > 0)
      widgetList.add(detectLinkInText(textBuilder));

    return widgetList;

  }

  String getLinkInImgTag(String tagImg) {
    var tagImgstartIndex = tagImg.indexOf("http");
    var tagImgendIndex = tagImg.substring(tagImgstartIndex).indexOf("\"");
    var tagImgendLink = tagImgstartIndex + tagImgendIndex;
    return tagImg.substring(tagImgstartIndex,tagImgendLink);
  }

  Widget detectLinkInText(String text){

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

    if(textBuilder.length > 0)
      textSpanList.add(buildTextSpan(textBuilder));

    return Padding(
      padding: const EdgeInsets.only(left:15.0,right: 15.0),
      child: RichText(
          text: TextSpan(
            children: textSpanList,
          )
      ),
    );

  }

  TextSpan buildTextSpan(String text,){
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
        ..onTap = () {
        clickLink(text);
        },
    );
  }

}