import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedConfetti extends StatefulWidget {
  AnimatedConfetti({Key key}) : super(key: key);

  @override
  _AnimatedConfettiState createState() => _AnimatedConfettiState();
}

class _AnimatedConfettiState extends State<AnimatedConfetti>
    with TickerProviderStateMixin {
  double _sparklesAngle = 0.0;
  final oneSecond = Duration(seconds: 1);
  final twoSeconds = Duration(seconds: 3);
  Random random;
  Timer holdTimer, scoreOutETA;
  AnimationController sparklesAnimationController;
  Animation scoreOutPositionAnimation, sparklesAnimation;

  initState() {
    super.initState();
    random = Random();

    sparklesAnimationController =
        AnimationController(vsync: this, duration: oneSecond);
    sparklesAnimation = CurvedAnimation(
        parent: sparklesAnimationController, curve: Curves.easeIn);
    sparklesAnimation.addListener(() {
      setState(() {});
    });
    sparklesAnimationController.forward(from: 0.0);
    increment(null); // Take care of tap
    holdTimer = Timer.periodic(twoSeconds, increment); // Takes care of hold
  }

  dispose() {
    sparklesAnimationController.dispose();
    super.dispose();
    holdTimer.cancel();
  }

  void increment(Timer t) {
    sparklesAnimationController.forward(from: 0.0);
    setState(() {
      _sparklesAngle = random.nextDouble() * (3 * pi);
    });
  }

  Widget getScoreButton() {
    var stackChildren = <Widget>[];

    var firstAngle = _sparklesAngle;
    var sparkleRadius = (sparklesAnimationController.value * 100);
    var sparklesOpacity = (1 - sparklesAnimation.value);

    for (int i = 0; i < 5; ++i) {
      var currentAngle = (firstAngle + ((2 * pi) / 5) * (i));
      var sparklesWidget = Positioned(
        child: Transform.rotate(
            angle: currentAngle - pi / 2,
            child: Opacity(
                opacity: sparklesOpacity,
                child: Image.asset(
                  "assets/sparkles.png",
                  width: 14.0,
                  height: 14.0,
                ))),
        left: (sparkleRadius * cos(currentAngle) + 20),
        top: (sparkleRadius * sin(currentAngle) + 30),
      );
      stackChildren.add(sparklesWidget);
    }

    stackChildren.add(Image.asset(
      'assets/cupom.png',
      height: 60,
    ));

    var widget = Stack(
      alignment: FractionalOffset.center,
      overflow: Overflow.visible,
      children: stackChildren,
    );
    return widget;
  }

  @override
  Widget build(BuildContext context) {
    return getScoreButton();
  }
}
