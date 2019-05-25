
import 'dart:convert';

import 'package:dart_lang_br_flutter_app/repository/TwitterRepository/model/TwitterModel.dart';
import 'package:twitter/twitter.dart';

abstract class TwitterRepository{

  Future<List<TwitterModel>> getTimeLine();

}

class TwitterRepositoryImpl implements TwitterRepository{

  Twitter twitterApi;

  TwitterRepositoryImpl(){
    twitterApi = Twitter(
        'YOUR CONSUMER KEY', 'YOUR CONSUMER SERCRET',
        'YOUR ACCESS TOKEN', 'YOUR ACCESS TOKEN SECERT'
    );
  }

  @override
  Future<List<TwitterModel>> getTimeLine() async{

    var response = await twitterApi.request("GET", "statuses/user_timeline.json");
    twitterApi.close();
    const JsonDecoder decoder = const JsonDecoder();
    List resp = decoder.convert(response.body);

    return resp.map<TwitterModel>((i)=>TwitterModel.fromJson(i)).toList();
  }

}