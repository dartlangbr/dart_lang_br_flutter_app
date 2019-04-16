import 'package:dart_lang_br_flutter_app/support/bloc/bloc_view.dart';
import 'package:dart_lang_br_flutter_app/support/bloc/events_base.dart';
import 'package:dart_lang_br_flutter_app/support/bloc/stream_base.dart';
import 'package:dart_lang_br_flutter_app/support/bloc/stream_create.dart';
import 'package:meta/meta.dart';

abstract class BlocBase<T extends StreamsBase, E extends EventsBase> {

  var _eventToBloc = PublishSubjectCreate<E>();
  var _eventToView = PublishSubjectCreate<E>();

  T streams;
  BlocView _view;

  BlocBase() {
    _eventToBloc.get.listen(eventReceiver);
  }

  void registerView(BlocView view) {
    if(view == null){
      this._view = view;
      _eventToView.get.listen(this._view.eventReceiver);
    }
  }

  void dispatchView(E event) {
    _eventToView.set(event);
  }

  void dispatch(E event) {
    _eventToBloc.set(event);
  }

  void initView();

  @protected
  void eventReceiver(E event);

  void dispose() {
    streams.dispose();
    _eventToBloc.close();
    _eventToView.close();
  }
}