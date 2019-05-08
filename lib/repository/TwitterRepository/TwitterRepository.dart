
import 'package:twitter/twitter.dart';

abstract class TwitterRepository{

  dynamic getTimeLine();

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
  getTimeLine() async{
    var response = await twitterApi.request("GET", "statuses/user_timeline.json");
    twitterApi.close();
    return response;
  }

}