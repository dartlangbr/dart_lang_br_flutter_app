import 'package:flutter/material.dart';

class MySizeAnimated extends StatefulWidget {
  final Widget child;

  const MySizeAnimated({Key key, this.child}) : super(key: key);
  @override
  _MySizeAnimatedState createState() => _MySizeAnimatedState();
}

class _MySizeAnimatedState extends State<MySizeAnimated> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      alignment: Alignment.topCenter,
        duration: Duration(milliseconds: 400),
        curve: Curves.ease,
        vsync: this,
        child: widget.child,
    );
  }
}
