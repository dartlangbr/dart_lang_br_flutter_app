
import 'package:bsev/bsev.dart';
import 'package:dart_lang_br_flutter_app/pages/twitter/TwitterBloc.dart';
import 'package:dart_lang_br_flutter_app/pages/twitter/TwitterEvents.dart';
import 'package:dart_lang_br_flutter_app/pages/twitter/TwitterStreams.dart';
import 'package:dart_lang_br_flutter_app/repository/TwitterRepository/model/TwitterModel.dart';
import 'package:dart_lang_br_flutter_app/support/Util.dart';
import 'package:dart_lang_br_flutter_app/widgets/TwitterWidget.dart';
import 'package:flutter/material.dart';

class TwitterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Bsev<TwitterBloc,TwitterStreams>(
      builder: (context,dispatcher,streams){
        return Stack(
          children: <Widget>[
            _buildList(streams),
            _buildProgress(streams),
            _buildErrorConection(streams,dispatcher)
          ],
        );
      },
    );
  }

  Widget _buildList(TwitterStreams streams) {
    return StreamBuilder(
      stream: streams.twitters.get,
      initialData: List<TwitterModel>(),
      builder: (_,snapshot){

        List<TwitterModel> t = snapshot.data;
        int size = t == null ? 0 : t.length;

        return AnimatedOpacity(
          opacity: size == 0 ? 0:1,
          duration: Duration(seconds: 1),
          child: ListView.builder(
              itemCount:size,
              itemBuilder: (_,index){
                return TwitterWidget(item:t[index]);
              }),
        );

      },
    );
  }

  Widget _buildProgress(TwitterStreams streams) {
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

  Widget _buildErrorConection(TwitterStreams streams,dispatcher) {
    return StreamBuilder(
      initialData: false,
      stream: streams.showError.get,
      builder: (_,snapshot){
        if(snapshot.hasData && snapshot.data)  {
          return buildLayoutTryAgain((){
            dispatcher(LoadTwitter());
          });
        }else{
          return Container();
        }
      },
    );
  }

}