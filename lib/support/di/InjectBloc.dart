import 'package:dart_lang_br_flutter_app/pages/home/HomeBloc.dart';
import 'package:dart_lang_br_flutter_app/pages/twitter/TwitterBloc.dart';
import 'package:dart_lang_br_flutter_app/pages/youtube/YoutubeBloc.dart';
import 'package:injector/injector.dart';

injectBloc(Injector injector){

  injector.registerDependency((i)=>HomeBloc(i.getDependency()));
  injector.registerDependency((i)=>YoutubeBloc(i.getDependency()));
  injector.registerDependency((i)=>TwitterBloc(i.getDependency(),i.getDependency()));

}
