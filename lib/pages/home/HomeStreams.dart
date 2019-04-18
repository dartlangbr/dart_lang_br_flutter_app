

import 'package:dart_lang_br_flutter_app/repository/PostsRepository/model/Post.dart';
import 'package:dart_lang_br_flutter_app/support/bloc/stream_base.dart';
import 'package:dart_lang_br_flutter_app/support/bloc/stream_create.dart';

class HomeStreams implements StreamsBase{

  var posts = BehaviorSubjectCreate<List<Post>>();

  var showProgress = BehaviorSubjectCreate<bool>();

  @override
  void dispose() {
    posts.close();
    showProgress.close();
  }

}