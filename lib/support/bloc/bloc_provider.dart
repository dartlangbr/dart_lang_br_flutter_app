import 'package:dart_lang_br_flutter_app/support/bloc/bloc_base.dart';
import 'package:flutter/material.dart';

Type _typeOf<T>() => T;

class BlocProvider<T extends BlocBase> extends StatefulWidget {
  BlocProvider({
    Key key,
    @required this.child,
    @required this.bloc,
    this.forceUpdateBloc = false,
  }) : super(key: key);

  final Widget child;
  final T bloc;
  final bool forceUpdateBloc;

  @override
  _BlocProviderState<T> createState() => _BlocProviderState<T>();

  static T of<T extends BlocBase>(BuildContext context) {
    final type = _typeOf<_BlocProviderInherited<T>>();
    _BlocProviderInherited<T> provider =
        context.ancestorInheritedElementForWidgetOfExactType(type)?.widget;
    return provider?.bloc;
  }
}

class _BlocProviderState<T extends BlocBase> extends State<BlocProvider<T>> {

  T bloc;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
    super.initState();
    _initStateBloc();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    if(widget.forceUpdateBloc && !bloc.isInitState){
      setState(() {
        _initStateBloc();
      });
    }

    bloc.isInitState = false;

    return new _BlocProviderInherited<T>(
      bloc: bloc,
      child: widget.child,
    );
  }

  void _initStateBloc() {
    bloc?.dispose();
    bloc = widget.bloc;
    bloc.isInitState = true;
    bloc.initState();
  }

  void _afterLayout(_) {
    widget.bloc.initView();
  }

}

class _BlocProviderInherited<T> extends InheritedWidget {
  _BlocProviderInherited({
    Key key,
    @required Widget child,
    @required this.bloc,
  }) : super(key: key, child: child);

  final T bloc;

  @override
  bool updateShouldNotify(_BlocProviderInherited oldWidget) => false;
}
