
import 'package:dart_lang_br_flutter_app/repository/PostsRepository/PostsRepository.dart';
import 'package:dart_lang_br_flutter_app/support/conection/con.dart';
import 'package:simple_injector/module_injector.dart';
import 'package:simple_injector/simple_injector.dart';

class RepositoryModule extends ModuleInjector{

  RepositoryModule(){
    add(Con, conCreate, isSingleton: true);
    add(PostsRepository, postsRepositoryCreate);
  }

  Con conCreate(){
    Con con;
    switch(flavor){
      case Flavor.HOMOLOG: con = ConDioImpl("http://localhost/"); break;
      case Flavor.DEBUG: con = ConDioImpl("http://localhost/"); break;
      case Flavor.PROD: con = ConDioImpl("http://dartlang.com.br/api/"); break;
    }
    return con;
  }

  PostsRepository postsRepositoryCreate(){
    return PostsRepositoryImpl(
      inject()
    );
  }

}