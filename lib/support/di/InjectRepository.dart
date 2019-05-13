
import 'package:bsev/flavors.dart';
import 'package:dart_lang_br_flutter_app/repository/MetaDataRepository/MetaDataRepository.dart';
import 'package:dart_lang_br_flutter_app/repository/PostsRepository/PostsRepository.dart';
import 'package:dart_lang_br_flutter_app/repository/TwitterRepository/TwitterRepository.dart';
import 'package:dart_lang_br_flutter_app/repository/YoutubeRepository/YoutubeRepository.dart';
import 'package:dart_lang_br_flutter_app/support/conection/con.dart';
import 'package:injector/injector.dart';

injectRepository(Injector injector){

  injector.registerDependency<PostsRepository>((i)=>PostsRepositoryImpl(i.getDependency()));
  injector.registerDependency<TwitterRepository>((i)=>TwitterRepositoryImpl());
  injector.registerDependency<MetaDataRepository>((i)=>MetaDataRepositoryImpl(i.getDependency()));
  injector.registerDependency<YoutubeRepository>((i)=>YoutubeRepositoryImpl());

  injector.registerSingleton((i){
    Con con;
    switch(Flavors().getFlavor()){
      case Flavor.HOMOLOG: con = ConDioImpl("http://localhost/"); break;
      case Flavor.DEBUG: con = ConDioImpl("http://localhost/"); break;
      case Flavor.PROD: con = ConDioImpl("http://dartlang.com.br/api/"); break;
    }
    return con;
  });

}