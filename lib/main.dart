import 'package:dart_lang_br_flutter_app/pages/BaseView.dart';
import 'package:dart_lang_br_flutter_app/support/injector/BlocModule.dart';
import 'package:dart_lang_br_flutter_app/support/injector/RepositoryModule.dart';
import 'package:flutter/material.dart';
import 'package:simple_injector/simple_injector.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  MyApp(){
    SimpleInjector.configure(Flavor.PROD);
    SimpleInjector().registerModule(RepositoryModule());
    SimpleInjector().registerModule(BlocModule());
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
