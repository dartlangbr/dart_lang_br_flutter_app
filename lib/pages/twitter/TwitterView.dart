
import 'package:bsev/bsev.dart';
import 'package:dart_lang_br_flutter_app/pages/twitter/TwitterBloc.dart';
import 'package:dart_lang_br_flutter_app/pages/twitter/TwitterEvents.dart';
import 'package:dart_lang_br_flutter_app/pages/twitter/TwitterStreams.dart';
import 'package:dart_lang_br_flutter_app/repository/TwitterRepository/model/TwitterModel.dart';
import 'package:flutter/material.dart';

class TwitterView extends BlocStatelessView<TwitterBloc,TwitterStreams,TwitterEvents> {

  @override
  Widget buildView(BuildContext context) {

    return Container(
      child: _buildList(),
    );
  }

  @override
  void eventReceiver(TwitterEvents event) {
    // TODO: implement eventReceiver
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
            return Text(t[index].text);
          });

        }else{
          return Container();
        }
      },
    );
  }
}
