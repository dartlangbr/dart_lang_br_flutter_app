
import 'package:bsev/bsev.dart';
import 'package:dart_lang_br_flutter_app/repository/TwitterRepository/model/TwitterModel.dart';

class TwitterStreams extends StreamsBase{

  var twitters = BehaviorSubjectCreate<List<TwitterModel>>();

  @override
  void dispose() {
    twitters.close();
  }

}