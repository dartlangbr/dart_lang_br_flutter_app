
import 'package:dart_lang_br_flutter_app/repository/Repository.dart';
import 'package:dart_lang_br_flutter_app/support/conection/con.dart';

enum Flavor {
  HOMOLOG,
  PROD
}

/// Simple DI
class Injector {
  static final Injector _singleton = new Injector._internal();
  static Flavor _flavor;
  Repository repositories;

  static void configure(Flavor flavor) {
    _flavor = flavor;
  }

  factory Injector() {
    return _singleton;
  }

  Injector._internal();
  
  T getRepository<T>(){
    if(repositories == null){
      Con con;
      switch(_flavor){
        case Flavor.HOMOLOG: con = ConDioImpl("http://localhost/"); break;
        case Flavor.PROD: con = ConDioImpl("http://dartlang.com.br/api/"); break;
      }
      repositories = RepositoryImpl(con);
    }
    return repositories.getRepository();
  }
  
}