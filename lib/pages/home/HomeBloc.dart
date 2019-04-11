

import 'package:dart_lang_br_flutter_app/pages/home/HomeEvents.dart';
import 'package:dart_lang_br_flutter_app/pages/home/HomeStreams.dart';
import 'package:dart_lang_br_flutter_app/repository/WordPressRepository.dart';
import 'package:dart_lang_br_flutter_app/support/bloc/bloc_base.dart';

class HomeBloc extends BlocBase<HomeStreams,HomeEvents>{

  final WordPressRepository repository;

  HomeBloc(this.repository){
    streams = HomeStreams();
  }

  int _page = 1;

  @override
  void eventReceiver(HomeEvents event) {

    if(event is HomeLoad){
      _load(event.data);
    }
  }

  void _load(bool isMore) {

    streams.showProgress.set(true);
    repository.loadPost(_page,20).then((posts){
      streams.posts.set(posts);
      streams.showProgress.set(false);
    }).catchError((error){
      streams.showProgress.set(false);
      print(error);
    });
  }

}