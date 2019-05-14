
import 'package:dart_lang_br_flutter_app/repository/MetaDataRepository/MetaDataRepository.dart';
import 'package:dart_lang_br_flutter_app/repository/MetaDataRepository/model/UrlMetaData.dart';
import 'package:dart_lang_br_flutter_app/repository/TwitterRepository/TwitterRepository.dart';
import 'package:dart_lang_br_flutter_app/repository/TwitterRepository/model/TwitterModel.dart';
import 'package:bsev/bsev.dart';
import 'package:dart_lang_br_flutter_app/pages/twitter/TwitterEvents.dart';
import 'package:dart_lang_br_flutter_app/pages/twitter/TwitterStreams.dart';
import 'package:dart_lang_br_flutter_app/support/Util.dart';

class TwitterBloc extends BlocBase<TwitterStreams,TwitterEvents>{

  final  MetaDataRepository _metaDataRepository;
  final TwitterRepository _repository;

  TwitterBloc(this._repository, this._metaDataRepository);

  List<TwitterModel> listTwitters;

  @override
  void eventReceiver(TwitterEvents event) {

    if(event is LoadTwitter){
      _loadTwitters();
    }

  }

  @override
  void initState() {
    streams = TwitterStreams();
  }

  @override
  void initView() {
    _loadTwitters();
  }

  void _loadTwitters(){

    streams.showProgress.set(true);

    _repository.getTimeLine().then((twitters){

      listTwitters = twitters;
      streams.showError.set(false);
      streams.showProgress.set(false);
      streams.twitters.set(listTwitters);

      loadMetadatas();

    }).catchError((error){
      streams.showError.set(true);
      streams.showProgress.set(false);
    });
  }

  void loadMetadatas() async{

    listTwitters.forEach((i) async {
      if(i.text.contains("http")){
        if(i.metaData == null){
          var link = getFisrtLinkInText(i.text);

          try{
            var m =  await _metaDataRepository.getMetadata(link);
            i.metaData = m;
            i.metaData.link = link;
            streams.twitters.set(listTwitters);
          }catch(e){
            i.metaData = UrlMetaData();
            i.metaData.link = link;
          }

        }
      }

    });
  }

}
