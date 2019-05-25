
import 'package:dart_lang_br_flutter_app/support/Util.dart';
import 'package:flutter/material.dart';

class ImgFull extends StatelessWidget {
  final String link;

  const ImgFull({Key key, this.link}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ImgHeroFromNetwork(link,tagHero: link),
      ),
    );
  }
}
