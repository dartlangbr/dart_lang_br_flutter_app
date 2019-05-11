import 'package:dart_lang_br_flutter_app/pages/BaseView.dart';
import 'package:dart_lang_br_flutter_app/support/di/InjectBloc.dart';
import 'package:dart_lang_br_flutter_app/support/di/InjectRepository.dart';
import 'package:flutter/material.dart';
import 'package:bsev/flavors.dart';
import 'package:injector/injector.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  MyApp(){
    Flavors.configure(Flavor.PROD);
    injectRepository(Injector.appInstance);
    injectBloc(Injector.appInstance);
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DartLangBr',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BaseView(),
    );
  }
}
