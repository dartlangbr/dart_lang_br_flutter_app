import 'package:dart_lang_br_flutter_app/pages/BaseView.dart';
import 'package:dart_lang_br_flutter_app/support/Util.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with TickerProviderStateMixin {

  double _opacitycristo = 0;

  AnimationController _controllerSaleDart;
  Animation<double> _dartAnimation;

  AnimationController _controllerSlideCristo;
  Animation<Offset> _cristoAnimation;

  AnimationController _controllerSizeNames;
  Animation<double> _sizeNamesdartAnimation;

  AnimationController _controllerDartLang;
  Animation<Offset> _dartLangSlideAnimation;
  AnimationController _controllerBrasil;

  @override
  void initState() {
    _controllerSaleDart = AnimationController(vsync: this,duration: Duration(milliseconds: 300));
    _dartAnimation = CurvedAnimation(parent: _controllerSaleDart, curve: Curves.ease);
    _controllerSaleDart.addStatusListener((status){
      if(status == AnimationStatus.completed){
        setState(() {
          _opacitycristo = 1.0;
        });
        _controllerSlideCristo.forward(from: 0.0);
      }
    });

    _controllerSlideCristo = AnimationController(vsync: this,duration: Duration(milliseconds: 800));
    _controllerSlideCristo.addStatusListener((status){
      if(status == AnimationStatus.completed){
        _controllerSizeNames.forward(from: 0.0);
      }
    });
    _cristoAnimation = new Tween(
        begin: Offset(0.0,2.0)
        , end: Offset(0.0,0.0)
    ).animate(
        CurvedAnimation(
            parent: _controllerSlideCristo,
            curve: Curves.elasticOut
        )
    );

    _controllerSizeNames = AnimationController(vsync: this,duration: Duration(milliseconds: 300));
    _sizeNamesdartAnimation = CurvedAnimation(parent: _controllerSizeNames, curve: Curves.ease);
    _controllerSizeNames.addStatusListener((status){
      if(status == AnimationStatus.completed){
        _controllerDartLang.forward(from: 0.0);
      }
    });

    _controllerDartLang = AnimationController(vsync: this,duration: Duration(milliseconds: 300));
    _controllerDartLang.addStatusListener((status){
      if(status == AnimationStatus.completed){
        _controllerBrasil.forward(from: 0.0);
      }
    });
    _dartLangSlideAnimation = Tween(
        begin: Offset(1.0,0.0)
        , end: Offset(0.0,0.0)
    ).animate(
        CurvedAnimation(
            parent: _controllerDartLang,
            curve: Curves.ease
        )
    );

    _controllerBrasil = AnimationController(vsync: this,duration: Duration(milliseconds: 300));
    _controllerBrasil.addStatusListener((status){
      if(status == AnimationStatus.completed){
        Future.delayed(Duration(milliseconds: 300),(){
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => BaseView()),
          );
        });
      }
    });

    Future.delayed(Duration(milliseconds: 600),(){
      _controllerSaleDart.forward(from: 0.0);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _buildImgDart(),
            _buildName()
          ],
        ),
      ),
    );
  }

  _buildImgDart() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        _buildAnimatedCristo(),
        _buildAnimatedDart(),
      ],
    );
  }

  _buildName() {
    return Container(
      height: 70,
      child: SizeTransition(
        sizeFactor: _sizeNamesdartAnimation,
        axis:Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.only(left:10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              SlideTransition(
                position: _dartLangSlideAnimation,
                child: FadeTransition(
                  opacity: _controllerDartLang,
                  child: Text(
                      "DART LANG",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                      color: ColorFromHex(code: "#0058a4")
                    ),
                  ),
                ),
              ),
              FadeTransition(
                opacity: _controllerBrasil,
                child: Text(
                    "BRASIL",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                    color: ColorFromHex(code: "#00b9fa")
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _buildAnimatedCristo() {
    return SlideTransition(
      position: _cristoAnimation,
      child: Opacity(
        opacity: _opacitycristo,
        child: Padding(
          padding: EdgeInsets.only(left:5.0),
          child: Image.asset(
            'assets/cristo.png',
            height: 25,
          ),
        ),
      ),
    );
  }

  _buildAnimatedDart() {
    return ScaleTransition(
      scale: _dartAnimation,
      child: Image.asset(
        'assets/dart.png',
        height: 60,
      ),
    );
  }

  @override
  void dispose() {
    _controllerSaleDart.dispose();
    _controllerSlideCristo.dispose();
    _controllerSizeNames.dispose();
    _controllerDartLang.dispose();
    _controllerBrasil.dispose();
    super.dispose();
  }
}
