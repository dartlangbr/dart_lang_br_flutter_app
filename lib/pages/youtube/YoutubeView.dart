
import 'package:bsev/bsev.dart';
import 'package:dart_lang_br_flutter_app/pages/youtube/YoutubeBloc.dart';
import 'package:dart_lang_br_flutter_app/pages/youtube/YoutubeEvents.dart';
import 'package:dart_lang_br_flutter_app/pages/youtube/YoutubeStreams.dart';
import 'package:dart_lang_br_flutter_app/support/Util.dart';
import 'package:dart_lang_br_flutter_app/support/youtube_api/youtube_api.dart';
import 'package:dart_lang_br_flutter_app/widgets/YoutubeWidget.dart';
import 'package:flutter/material.dart';

class YoutubeView extends BlocStatelessView<YoutubeBloc,YoutubeStreams> {

  @override
  Widget buildView(BuildContext context, YoutubeStreams streams) {
    return Stack(
      children: <Widget>[
        _buildList(streams),
        _buildProgress(streams),
        _buildErrorConection(streams)
      ],
    );
  }

  @override
  void eventReceiver(EventsBase event) {
  }

  Widget _buildProgress(YoutubeStreams streams) {
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

  _buildList(YoutubeStreams streams) {
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

  _buildErrorConection(YoutubeStreams streams) {
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

