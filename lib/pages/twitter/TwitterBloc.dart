
import 'package:dart_lang_br_flutter_app/repository/MetaDataRepository/MetaDataRepository.dart';
import 'package:dart_lang_br_flutter_app/repository/TwitterRepository/TwitterRepository.dart';
import 'package:dart_lang_br_flutter_app/repository/TwitterRepository/model/TwitterModel.dart';
import 'package:bsev/bsev.dart';
import 'package:dart_lang_br_flutter_app/pages/twitter/TwitterEvents.dart';
import 'package:dart_lang_br_flutter_app/pages/twitter/TwitterStreams.dart';

class TwitterBloc extends BlocBase<TwitterStreams,TwitterEvents>{

  final  MetaDataRepository _metaDataRepository;
  final TwitterRepository _repository;

  TwitterBloc(this._repository, this._metaDataRepository);

  List<TwitterModel> listTwitters;

  @override
  void eventReceiver(TwitterEvents event) {

  }

  @override
  void initState() {
    streams = TwitterStreams();
  }

  @override
  void initView() {
    loadTwitters();
  }

  void loadTwitters(){
    streams.showProgress.set(true);
    _repository.getTimeLine().then((twitters){
      streams.showProgress.set(false);
      listTwitters = twitters;
      streams.twitters.set(listTwitters);
      loadMetadatas();
    });
  }

  void loadMetadatas() async{

    listTwitters.forEach((i) async {
      if(i.text.contains("http")){
        if(i.metaData == null){
          var link = getLinkInImgTag(i.text);
          var m =  await _metaDataRepository.getMetadata(link);
          i.metaData = m;
          i.metaData.link = link;
          streams.twitters.set(listTwitters);
        }
      }

    });
  }

  String getLinkInImgTag(String tagImg) {

    var tagImgstartIndex = tagImg.indexOf("http");
    var tagImgendIndex = tagImg.substring(tagImgstartIndex).indexOf(" ");
    var tagImgendLink = tagImg.length;
    if(tagImgendIndex > -1){
      tagImgendLink = tagImgstartIndex + tagImgendIndex;
    }

    return tagImg.substring(tagImgstartIndex,tagImgendLink);
  }

}
