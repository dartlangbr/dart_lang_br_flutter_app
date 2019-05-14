

import 'package:dart_lang_br_flutter_app/support/youtube_api/youtube_api.dart';

abstract class YoutubeRepository{
  Future<List<YT_API>> getVideos();
}

class YoutubeRepositoryImpl implements YoutubeRepository{

  YoutubeAPI youtubeAPI;

  YoutubeRepositoryImpl(){
    youtubeAPI = YoutubeAPI(
        "",
        maxResults: 25,
    );
  }

  @override
  Future<List<YT_API>> getVideos() async {
    return await youtubeAPI.channel("UCFKrc_1MHO1kdJ1p7qMeuYw");
  }

}