import 'package:dart_lang_br_flutter_app/repository/WordPressRepository.dart';
import 'package:dart_lang_br_flutter_app/support/conection/WordPressApi.dart';

enum Flavor {
  HOMOLOG,
  PROD
}

/// Simple DI
class Injector {
  static final Injector _singleton = new Injector._internal();
  static Flavor _flavor;
  WordPressApi _wordPressApi;

  static void configure(Flavor flavor) {
    _flavor = flavor;
  }

  factory Injector() {
    return _singleton;
  }

  Injector._internal();

  WordPressRepository get wordPressRepository {
    if(_wordPressApi == null ){
      String url = "";
      switch(_flavor){
        case Flavor.HOMOLOG: url = "http://localhost"; break;
        case Flavor.PROD: url = "http://dartlang.com.br/"; break;
      }
      _wordPressApi = WordPressApi(url);
    }

    return WordPressRepositoryImpl(_wordPressApi);
  }
}