import 'package:dart_lang_br_flutter_app/pages/BaseView.dart';
import 'package:dart_lang_br_flutter_app/support/injector/Injector.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  MyApp(){
    Injector.configure(Flavor.PROD);
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
