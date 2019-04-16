

import 'package:dart_lang_br_flutter_app/repository/PostsRepository/model/Post.dart';
import 'package:dart_lang_br_flutter_app/support/bloc/stream_base.dart';
import 'package:dart_lang_br_flutter_app/support/bloc/stream_create.dart';

class HomeStreams implements StreamsBase{

  var posts = PublishSubjectCreate<List<Post>>();

  var showProgress = PublishSubjectCreate<bool>();

  @override
  void dispose() {
    posts.close();
    showProgress.close();
  }

}