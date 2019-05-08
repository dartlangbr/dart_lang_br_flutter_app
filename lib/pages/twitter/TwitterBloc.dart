
import 'package:dart_lang_br_flutter_app/repository/TwitterRepository/TwitterRepository.dart';
import 'package:flutter/material.dart';
import 'package:twitter/twitter.dart';
import 'package:bsev/bsev.dart';
import 'package:dart_lang_br_flutter_app/pages/twitter/TwitterEvents.dart';
import 'package:dart_lang_br_flutter_app/pages/twitter/TwitterStreams.dart';

class TwitterBloc extends BlocBase<TwitterStreams,TwitterEvents>{

  final TwitterRepository _repository;

  TwitterBloc(this._repository);

  @override
  void eventReceiver(TwitterEvents event) {

  }

  @override
  void initState() {
    streams = TwitterStreams();
  }

  @override
  void initView() {
    loadTwitters();
  }

  void loadTwitters() async{
    var response = await _repository.getTimeLine();
    debugPrint(response.body);
  }

}