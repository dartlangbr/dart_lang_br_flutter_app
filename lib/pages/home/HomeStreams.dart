
import 'package:dart_lang_br_flutter_app/repository/PostsRepository/model/Post.dart';
import 'package:bsev/bsev.dart';

class HomeStreams implements StreamsBase{

  var posts = BehaviorSubjectCreate<List<Post>>();

  var showProgress = BehaviorSubjectCreate<bool>();

  @override
  void dispose() {
    posts.close();
    showProgress.close();
  }

}