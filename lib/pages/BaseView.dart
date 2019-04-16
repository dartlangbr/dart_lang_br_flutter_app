
import 'package:dart_lang_br_flutter_app/pages/home/HomeBloc.dart';
import 'package:dart_lang_br_flutter_app/pages/home/HomeView.dart';
import 'package:dart_lang_br_flutter_app/support/bloc/stream_create.dart';
import 'package:dart_lang_br_flutter_app/support/injector/Injector.dart';
import 'package:dart_lang_br_flutter_app/widgets/CustomBottomNavigation.dart';
import 'package:flutter/material.dart';

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
        if(snapshot.data == 0){
          return HomeView().create(
              HomeBloc(
                  Injector().getRepository()
              )
          );
        }else{
          return Container();
        }
      },
    );
  }
}
