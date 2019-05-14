
import 'package:dart_lang_br_flutter_app/pages/home/HomeView.dart';
import 'package:bsev/bsev.dart';
import 'package:dart_lang_br_flutter_app/pages/twitter/TwitterView.dart';
import 'package:dart_lang_br_flutter_app/repository/YoutubeRepository/YoutubeRepository.dart';
import 'package:dart_lang_br_flutter_app/support/youtube_api/youtube_api.dart';
import 'package:dart_lang_br_flutter_app/widgets/CustomBottomNavigation.dart';
import 'package:flutter/material.dart';
import 'package:injector/injector.dart';

class BaseView extends StatelessWidget {

  final positionController  = StreamCreate<int>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavigation(),
    );
  }

  Widget _buildBottomNavigation() {
    return CustomBottomNavigation(
      onTap: (position){
        positionController.set(position);
      },
    );
  }

  Widget _buildBody() {
    return StreamBuilder(
      stream: positionController.get,
      initialData: 0,
      builder: (context,snapshot){
        switch(snapshot.data){
          case 0:
            return HomeView().create();
          case 2:
          return TwitterView().create();
          default: loadYoutube(); return Container();
        }
      },
    );
  }

  void loadYoutube() async{
    YoutubeRepository r = Injector.appInstance.getDependency();
    List<YT_API> res = await r.getVideos();
    res.forEach((i){
      print("resp: ${i.thumbnail['high']['url']}");
    });
  }
}
