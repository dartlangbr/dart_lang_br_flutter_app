import 'package:dart_lang_br_flutter_app/pages/home/HomeBloc.dart';
import 'package:dart_lang_br_flutter_app/pages/home/HomeStreams.dart';
import 'package:dart_lang_br_flutter_app/pages/twitter/TwitterBloc.dart';
import 'package:dart_lang_br_flutter_app/pages/twitter/TwitterStreams.dart';
import 'package:dart_lang_br_flutter_app/pages/youtube/YoutubeBloc.dart';
import 'package:dart_lang_br_flutter_app/pages/youtube/YoutubeStreams.dart';
import 'package:injector/injector.dart';

injectBloc(Injector injector){

  injector.registerDependency((i)=>HomeBloc(i.getDependency()));
  injector.registerDependency((i)=>HomeStreams());

  injector.registerDependency((i)=>YoutubeBloc(i.getDependency()));
  injector.registerDependency((i)=>YoutubeStreams());

  injector.registerDependency((i)=>TwitterBloc(i.getDependency(),i.getDependency()));
  injector.registerDependency((i)=>TwitterStreams());

}
