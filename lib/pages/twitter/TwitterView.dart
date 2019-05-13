
import 'package:bsev/bsev.dart';
import 'package:dart_lang_br_flutter_app/pages/twitter/TwitterBloc.dart';
import 'package:dart_lang_br_flutter_app/pages/twitter/TwitterEvents.dart';
import 'package:dart_lang_br_flutter_app/pages/twitter/TwitterStreams.dart';
import 'package:dart_lang_br_flutter_app/repository/TwitterRepository/model/TwitterModel.dart';
import 'package:dart_lang_br_flutter_app/widgets/TwitterWidget.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TwitterView extends BlocStatelessView<TwitterBloc,TwitterStreams,TwitterEvents> {

  @override
  Widget buildView(BuildContext context) {
    return Stack(
      children: <Widget>[
        _buildList(),
        _buildProgress()
      ],
    );
  }

  @override
  void eventReceiver(TwitterEvents event) {
  }

  _buildList() {
    return StreamBuilder(
      stream: streams.twitters.get,
      initialData: List<TwitterModel>(),
      builder: (_,snapshot){

        if(snapshot.hasData){

          List<TwitterModel> t = snapshot.data;

          return ListView.builder(
            itemCount: t.length,
              itemBuilder: (_,index){
            return TwitterWidget(item:t[index]);
          });

        }else{
          return Container();
        }
      },
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

}
