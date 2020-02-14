import 'package:flutter/material.dart';

class EasingAnimationWidget extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final double begin;
  final double end;
  const EasingAnimationWidget(
      {Key key,
      this.child,
      this.duration = const Duration(seconds: 1),
      this.begin = 1.0,
      this.end = 0})
      : super(key: key);
  @override
  EasingAnimationWidgetState createState() => EasingAnimationWidgetState();
}

class EasingAnimationWidgetState extends State<EasingAnimationWidget>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: widget.duration);

    _animation =
        Tween(begin: widget.begin, end: widget.end).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    ));
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, Widget child) {
          return Transform(
              transform:
                  Matrix4.translationValues(_animation.value * width, 0.0, 0.0),
              child: widget.child);
        });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
