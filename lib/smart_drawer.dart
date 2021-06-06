import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SmartDrawer extends StatefulWidget {
  final Widget menu;
  final Widget page;

  const SmartDrawer({
    Key? key,
    required this.menu,
    required this.page
  }) : super(key: key);

  @override
  SmartDrawerState createState() => SmartDrawerState(menu: this.menu, page: this.page);
}

class SmartDrawerState extends State<SmartDrawer> with TickerProviderStateMixin {
  final Widget menu;
  final Widget page;
  SmartDrawerState({required this.menu, required this.page});

  late final AnimationController _controllerAnimation = AnimationController(
    duration: const Duration(milliseconds: 300),
    vsync: this,
  );

  late final Animation<double> _animationTranslateX =
  Tween<double>(begin: .0, end: .6).animate(_controllerAnimation)
    ..addListener(() {
      setState(() {});
    });

  late final Animation<double> _animationTranslateY =
  Tween<double>(begin: .0, end: .2).animate(_controllerAnimation)
    ..addListener(() {
      setState(() {});
    });

  late final Animation<double> _animationTranslateScale =
  Tween<double>(begin: 1.0, end: .8).animate(_controllerAnimation)
    ..addListener(() {
      setState(() {});
    });

  late final Animation<double> _animationTranslateRotateZ =
  Tween<double>(begin: .0, end: .1).animate(_controllerAnimation)
    ..addListener(() {
      setState(() {});
    });

  late final Animation<double> _animationTranslateBorderRadius =
  Tween<double>(begin: .0, end: 50.0).animate(_controllerAnimation)
    ..addListener(() {
      setState(() {});
    });

  bool _hidePage = false;

  void openDrawer() async {
    setState(() {
      _hidePage = true;
    });
    await _controllerAnimation.forward();
  }

  void closeDrawer() async {
    setState(() {
      _hidePage = false;
    });
    await _controllerAnimation.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        new Scaffold(
            body: menu
        ),
        new Transform(
          alignment: FractionalOffset.center,
          transform: Matrix4.identity()
            ..rotateZ(_animationTranslateRotateZ.value)
            ..scale(_animationTranslateScale.value)
            ..translate(MediaQuery.of(context).size.width * _animationTranslateX.value,
                MediaQuery.of(context).size.height * _animationTranslateY.value),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: new BorderRadius.circular(50.0),
            ),
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              home: ClipRRect(
                borderRadius: BorderRadius.circular(_animationTranslateBorderRadius.value),
                child: Scaffold(
                    body: Stack(
                      children: [
                        page,
                        _hidePage
                            ?
                        BackdropFilter(
                          filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            color: Colors.black.withOpacity(.3),
                          ),
                        ) : Container(),
                      ],
                    )),
              ),
            ),
          ),
        ),
      ],
    );
  }
}