import 'package:bsev/bsev.dart';
import 'package:dart_lang_br_flutter_app/pages/youtube/YoutubeEvents.dart';
import 'package:dart_lang_br_flutter_app/pages/youtube/YoutubeStreams.dart';
import 'package:dart_lang_br_flutter_app/repository/YoutubeRepository/YoutubeRepository.dart';

class YoutubeBloc extends BlocBase<YoutubeStreams,YoutubeEvents>{

  final YoutubeRepository _youtubeRepository;

  YoutubeBloc(this._youtubeRepository);

  @override
  void eventReceiver(YoutubeEvents event) {

    if(event is LoadYoutube){
      _loadVideos();
    }

  }

  @override
  void initState() {
    streams = YoutubeStreams();
  }

  @override
  void initView() {

    _loadVideos();
  }

  void _loadVideos() {

    streams.showProgress.set(true);
    _youtubeRepository.getVideos().then((list){

      streams.showProgress.set(false);
      streams.showError.set(false);
      streams.videos.set(list);

    }).catchError((error){
      streams.showError.set(true);
      streams.showProgress.set(false);
    });

  }

}