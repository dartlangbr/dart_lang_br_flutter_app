
import 'package:dart_lang_br_flutter_app/pages/home/HomeEvents.dart';
import 'package:dart_lang_br_flutter_app/pages/home/HomeStreams.dart';
import 'package:dart_lang_br_flutter_app/repository/PostsRepository/PostsRepository.dart';
import 'package:dart_lang_br_flutter_app/support/bloc/bloc_base.dart';

class HomeBloc extends BlocBase<HomeStreams,HomeEvents>{

  final PostsRepository _postsRepository;

  HomeBloc(this._postsRepository);

  bool init = false;
  int _page = 0;

  @override
  void initState() {
    streams = HomeStreams();
  }

  @override
  void initView() {
    _load(false);
  }

  @override
  void eventReceiver(HomeEvents event) {

    if(event is HomeLoad){
      _load(false);
    }

    if(event is HomeLoadMore){
      _load(true);
    }
  }

  void _load(bool isMore) {

    if(isMore){
      _page ++;
    }else{
      _page = 0;
    }

    streams.showProgress.set(true);
    _postsRepository.loadPosts(10, _page).then((list){
      print(list);
      streams.posts.set(list);
      streams.showProgress.set(false);
    }).catchError((error){
      streams.showProgress.set(true);
    });
  }

}