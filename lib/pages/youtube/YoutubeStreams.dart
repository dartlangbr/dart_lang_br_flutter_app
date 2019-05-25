
import 'package:bsev/bsev.dart';
import 'package:dart_lang_br_flutter_app/support/youtube_api/youtube_api.dart';

class YoutubeStreams extends StreamsBase{

  var videos = BehaviorSubjectCreate<List<YT_API>>();
  var showProgress = BehaviorSubjectCreate<bool>();
  var showError = BehaviorSubjectCreate<bool>(initValue: false);

  @override
  void dispose() {
    videos.close();
    showProgress.close();
    showError.close();
  }

}