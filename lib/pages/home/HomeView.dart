import 'package:dart_lang_br_flutter_app/pages/home/HomeBloc.dart';
import 'package:dart_lang_br_flutter_app/pages/home/HomeEvents.dart';
import 'package:dart_lang_br_flutter_app/pages/home/HomeStreams.dart';
import 'package:dart_lang_br_flutter_app/repository/PostsRepository/model/Post.dart';
import 'package:bsev/bsev.dart';
import 'package:dart_lang_br_flutter_app/support/Util.dart';
import 'package:dart_lang_br_flutter_app/widgets/PostWidget.dart';
import 'package:flutter/material.dart';

class HomeView extends BlocStatelessView<HomeBloc,HomeStreams> {

  @override
  void eventReceiver(EventsBase event) {
  }

  @override
  Widget buildView(BuildContext context, HomeStreams streams) {
    return _buildBody(streams);
  }

  Widget _buildBody(HomeStreams streams) {
    return Stack(
      children: <Widget>[
        _buildList(streams),
        _buildProgress(streams),
        _buildErrorConection(streams)
      ],
    );
  }

  Widget _buildProgress(HomeStreams streams) {
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

  Widget _buildList(HomeStreams streams) {
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

                if(index > size - 2){
                  dispatch(HomeLoadMore());
                }

                return PostWidget(post: data[index],);
              }
          ),
        );
      },
    );
  }

  _buildErrorConection(HomeStreams streams) {
    return StreamBuilder(
      initialData: false,
      stream: streams.showError.get,
      builder: (_,snapshot){
        if(snapshot.hasData && snapshot.data)  {
          return buildLayoutTryAgain((){
            dispatch(HomeTryAgain());
          });
        }else{
          return Container();
        }
      },
    );
  }

}
