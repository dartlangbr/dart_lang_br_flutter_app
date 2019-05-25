
import 'package:dart_lang_br_flutter_app/repository/MetaDataRepository/model/UrlMetaData.dart';
import 'package:dart_lang_br_flutter_app/support/conection/con.dart';

abstract class MetaDataRepository{

  Future<UrlMetaData> getMetadata(String url);

}

class MetaDataRepositoryImpl implements MetaDataRepository{

  final Con con;

  MetaDataRepositoryImpl(this.con);

  @override
  Future<UrlMetaData> getMetadata(String url) async{

    Map<String,String> query = Map();
    query['url'] = url;

    Map result = await con.get('metadata',queryParameters: query);

    return UrlMetaData.fromJson(result);
  }


}