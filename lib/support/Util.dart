

import 'package:cached_network_image/cached_network_image.dart';
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