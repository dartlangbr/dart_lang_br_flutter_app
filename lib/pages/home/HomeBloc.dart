
import 'package:dart_lang_br_flutter_app/pages/home/HomeEvents.dart';
import 'package:dart_lang_br_flutter_app/pages/home/HomeStreams.dart';
import 'package:dart_lang_br_flutter_app/repository/PostsRepository/PostsRepository.dart';
import 'package:bsev/bsev.dart';
import 'package:dart_lang_br_flutter_app/repository/PostsRepository/model/Post.dart';

class HomeBloc extends BlocBase<HomeStreams,HomeEvents>{

  final PostsRepository _postsRepository;

  HomeBloc(this._postsRepository);

  int _page = 0;
  bool _isMore;
  List<Post> postList = List();

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

    if(event is HomeTryAgain){
      _load(_isMore);
    }
  }

  void _load(bool isMore) {

    if(streams.showProgress.value){
      return;
    }

    _isMore = isMore;

    if(isMore){
      _page ++;
    }else{
      _page = 0;
    }

    streams.showProgress.set(true);

    _postsRepository.loadPosts(10, _page).then((list){

      if(list.length > 0) {
        if (isMore) {
          postList.addAll(list);
        } else {
          postList = list;
        }
        streams.showError.set(false);
        streams.posts.set(postList);
      }

      streams.showProgress.set(false);

    }).catchError((error){

      streams.showError.set(true);
      streams.showProgress.set(false);

    });
  }

}