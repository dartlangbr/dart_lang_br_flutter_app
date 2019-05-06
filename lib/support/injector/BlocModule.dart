import 'package:dart_lang_br_flutter_app/pages/home/HomeBloc.dart';
import 'package:simple_injector/module_injector.dart';

class BlocModule extends ModuleInjector{

  BlocModule(){
    add(HomeBloc, homeBlocCreate);
  }

  HomeBloc homeBlocCreate(){
    return HomeBloc(
      inject()
    );
  }
}