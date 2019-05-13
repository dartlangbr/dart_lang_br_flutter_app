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
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: Text(item.text),
            )
        )
    );
  }
}
