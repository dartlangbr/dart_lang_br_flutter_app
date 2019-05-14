
import 'package:bsev/bsev.dart';
import 'package:dart_lang_br_flutter_app/pages/youtube/YoutubeBloc.dart';
import 'package:dart_lang_br_flutter_app/pages/youtube/YoutubeEvents.dart';
import 'package:dart_lang_br_flutter_app/pages/youtube/YoutubeStreams.dart';
import 'package:dart_lang_br_flutter_app/support/Util.dart';
import 'package:dart_lang_br_flutter_app/support/youtube_api/youtube_api.dart';
import 'package:dart_lang_br_flutter_app/widgets/YoutubeWidget.dart';
import 'package:flutter/material.dart';

class YoutubeView extends BlocStatelessView<YoutubeBloc,YoutubeStreams,YoutubeEvents> {


  @override
  Widget buildView(BuildContext context) {
    return Stack(
      children: <Widget>[
        _buildList(),
        _buildProgress(),
        _buildErrorConection()
      ],
    );
  }

  @override
  void eventReceiver(YoutubeEvents event) {
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

  _buildList() {
    return StreamBuilder(
      stream: streams.videos.get,
      initialData: List<YT_API>(),
      builder: (_,snapshot){

        List<YT_API> t = snapshot.data;
        int size = t == null ? 0 : t.length;

        return AnimatedOpacity(
          opacity: size == 0 ? 0:1,
          duration: Duration(seconds: 1),
          child: ListView.builder(
              itemCount:size,
              itemBuilder: (_,index){
                return YoutubeWidget(item:t[index]);
              }),
        );

      },
    );
  }

  _buildErrorConection() {
    return StreamBuilder(
      initialData: false,
      stream: streams.showError.get,
      builder: (_,snapshot){
        if(snapshot.hasData && snapshot.data)  {
          return buildLayoutTryAgain((){
            dispatch(LoadYoutube());
          });
        }else{
          return Container();
        }
      },
    );
  }

}

