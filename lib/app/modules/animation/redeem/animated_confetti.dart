import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedConfetti extends StatefulWidget {
  AnimatedConfetti({Key key}) : super(key: key);

  @override
  _AnimatedConfettiState createState() => new _AnimatedConfettiState();
}

class _AnimatedConfettiState extends State<AnimatedConfetti>
    with TickerProviderStateMixin {
  double _sparklesAngle = 0.0;
  final oneSecond = new Duration(seconds: 1);
  final twoSeconds = new Duration(seconds: 2);
  Random random;
  Timer holdTimer, scoreOutETA;
  AnimationController sparklesAnimationController;
  Animation scoreOutPositionAnimation, sparklesAnimation;

  initState() {
    super.initState();
    random = new Random();

    sparklesAnimationController =
        new AnimationController(vsync: this, duration: twoSeconds);
    sparklesAnimation = new CurvedAnimation(
        parent: sparklesAnimationController, curve: Curves.easeIn);
    sparklesAnimation.addListener(() {
      setState(() {});
    });

    increment(null); // Take care of tap
    holdTimer = new Timer.periodic(oneSecond, increment); // Takes care of hold
  }

  dispose() {
    super.dispose();
    sparklesAnimationController.dispose();
    holdTimer.cancel();
  }

  void increment(Timer t) {
    sparklesAnimationController.forward(from: 0.0);
    setState(() {
      _sparklesAngle = random.nextDouble() * (2 * pi);
    });
  }

  Widget getScoreButton() {
    var stackChildren = <Widget>[];

    var firstAngle = _sparklesAngle;
    var sparkleRadius = (sparklesAnimationController.value * 100);
    var sparklesOpacity = (1 - sparklesAnimation.value);

    for (int i = 0; i < 5; ++i) {
      var currentAngle = (firstAngle + ((2 * pi) / 5) * (i));
      var sparklesWidget = new Positioned(
        child: new Transform.rotate(
            angle: currentAngle - pi / 2,
            child: new Opacity(
                opacity: sparklesOpacity,
                child: new Image.asset(
                  "assets/sparkles.png",
                  width: 14.0,
                  height: 14.0,
                ))),
        left: (sparkleRadius * cos(currentAngle)) + 20,
        top: (sparkleRadius * sin(currentAngle)) + 20,
      );
      stackChildren.add(sparklesWidget);
    }

    stackChildren.add(Container());

    var widget = new Positioned(
      child: new Stack(
        alignment: FractionalOffset.center,
        overflow: Overflow.visible,
        children: stackChildren,
      ),
    );
    return widget;
  }

  Widget getClapButton() {
    return Image.asset(
      'assets/cupom.png',
      height: 100,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: FractionalOffset.center,
      overflow: Overflow.visible,
      children: <Widget>[
        getScoreButton(),
        getClapButton(),
      ],
    );
  }
}
