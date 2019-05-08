import 'package:dart_lang_br_flutter_app/pages/home/HomeBloc.dart';
import 'package:dart_lang_br_flutter_app/pages/twitter/TwitterBloc.dart';
import 'package:simple_injector/module_injector.dart';

class BlocModule extends ModuleInjector{

  BlocModule(){
    add(HomeBloc, homeBlocCreate);
    add(TwitterBloc, twitterCreate);
  }

  HomeBloc homeBlocCreate(){
    return HomeBloc(
      inject()
    );
  }

  TwitterBloc twitterCreate(){
    return TwitterBloc(
      inject()
    );
  }
}