import 'package:dart_lang_br_flutter_app/pages/home/HomeBloc.dart';
import 'package:dart_lang_br_flutter_app/pages/home/HomeEvents.dart';
import 'package:dart_lang_br_flutter_app/pages/home/HomeStreams.dart';
import 'package:dart_lang_br_flutter_app/repository/PostsRepository/model/Post.dart';
import 'package:dart_lang_br_flutter_app/support/bloc/bloc_view.dart';
import 'package:dart_lang_br_flutter_app/widgets/PostWidget.dart';
import 'package:flutter/material.dart';

class HomeView extends BlocStatelessView<HomeBloc,HomeStreams,HomeEvents> {

  @override
  void eventReceiver(HomeEvents event) {
  }

  @override
  Widget buildView(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    return Stack(
      children: <Widget>[
        _buildList(),
        _buildProgress()
      ],
    );
  }

  Widget _buildProgress() {
    return StreamBuilder(
      stream: streams.showProgress.get,
      builder: (_,snapshot){
        if(snapshot.hasData && snapshot.data){
          return Center(
            child: CircularProgressIndicator(),
          );
        }else{
          return Container();
        }
      },
    );
  }

  Widget _buildList() {
    return StreamBuilder(
      stream: streams.posts.get,
      builder: (_,snapshot){

        List<Post> data = snapshot.data;
        int size = data == null ? 0 : data.length;

        return AnimatedOpacity(
          opacity: size == 0 ? 0:1,
          duration: Duration(seconds: 1),
          child: ListView.builder(
              itemCount: size,
              itemBuilder: (_,index){
                return PostWidget(post: data[index],);
              }
          ),
        );
      },
    );
  }

}
