

abstract class YoutubeRepository{
  dynamic getVideos();
}

class YoutubeRepositoryImpl implements YoutubeRepository{
  @override
  getVideos() {
    // TODO: implement getVideos
    return null;
  }

//  YoutubeAPI youtubeAPI;
//
//  YoutubeRepositoryImpl(){
//    youtubeAPI = YoutubeAPI(
//        "",
//        maxResults: 25,
//        type: "channel"
//    );
//  }
//
//  @override
//  getVideos() async {
//    return await youtubeAPI.Channel("UCFKrc_1MHO1kdJ1p7qMeuYw");
//  }

}