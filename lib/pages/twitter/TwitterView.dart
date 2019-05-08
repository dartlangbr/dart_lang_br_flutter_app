
import 'package:bsev/bsev.dart';
import 'package:dart_lang_br_flutter_app/pages/twitter/TwitterBloc.dart';
import 'package:dart_lang_br_flutter_app/pages/twitter/TwitterEvents.dart';
import 'package:dart_lang_br_flutter_app/pages/twitter/TwitterStreams.dart';
import 'package:flutter/material.dart';

class TwitterView extends BlocStatelessView<TwitterBloc,TwitterStreams,TwitterEvents> {

  @override
  Widget buildView(BuildContext context) {

    return Container(
      color: Colors.cyan,
    );
  }

  @override
  void eventReceiver(TwitterEvents event) {
    // TODO: implement eventReceiver
  }
}
