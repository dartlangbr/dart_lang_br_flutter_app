
import 'package:bsev/bsev.dart';
import 'package:dart_lang_br_flutter_app/repository/TwitterRepository/model/TwitterModel.dart';

class TwitterStreams extends StreamsBase{

  var twitters = BehaviorSubjectCreate<List<TwitterModel>>();
  var showProgress = BehaviorSubjectCreate<bool>();

  @override
  void dispose() {
    twitters.close();
    showProgress.close();
  }

}