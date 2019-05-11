
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
        'v9nmdOdOsfE246ij5xqQd9vB0',
        '1f9y65jWT2WfgNzuGOHqjiAn0mJ565yfgvYOAUWNWzG53zXiyw',
        '1108321177842401280-2eGQMmHUJIzJYhZv9GoK0fFfxub7VC',
        'IKMaSwwZuWY6b6ThCCzOwHDzxoTl6qMT0ZEOjdjKDKr5h'
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