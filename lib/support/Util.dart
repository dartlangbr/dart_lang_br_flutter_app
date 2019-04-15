

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget ImgFromNetwork(String url, {BoxFit fit = BoxFit.cover}){

 return CachedNetworkImage(
    imageUrl: url,
    placeholder: (context, url) => new CircularProgressIndicator(),
    errorWidget: (context, url, error) => new Icon(Icons.error),
    fit: fit,
  );

}