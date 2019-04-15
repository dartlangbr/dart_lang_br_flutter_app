
import 'package:dart_lang_br_flutter_app/pages/home/HomeEvents.dart';
import 'package:dart_lang_br_flutter_app/pages/home/HomeStreams.dart';
import 'package:dart_lang_br_flutter_app/repository/PostsRepository/PostsRepository.dart';
import 'package:dart_lang_br_flutter_app/support/bloc/bloc_base.dart';

class HomeBloc extends BlocBase<HomeStreams,HomeEvents>{

  final PostsRepository _postsRepository;

  HomeBloc(this._postsRepository){
    streams = HomeStreams();
  }

  int _page = 0;

  @override
  void eventReceiver(HomeEvents event) {

    if(event is HomeLoad){
      _load(event.data);
    }
  }

  void _load(bool isMore) {
    _postsRepository.loadPosts(10, _page).then((list){
      print(list);
      streams.posts.set(list);
    });
  }

}