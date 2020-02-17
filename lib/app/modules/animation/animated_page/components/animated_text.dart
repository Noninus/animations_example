import 'package:flutter/material.dart';

class AnimatedTextWidget extends StatefulWidget {
  final Duration duration;
  final double begin;
  final double end;
  const AnimatedTextWidget(
      {Key key,
      this.duration = const Duration(seconds: 2),
      this.begin = 1.0,
      this.end = 0})
      : super(key: key);
  @override
  AnimatedTextWidgetState createState() => AnimatedTextWidgetState();
}

class AnimatedTextWidgetState extends State<AnimatedTextWidget>
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
    return AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, Widget child) {
          return Text(
            "${_animation.value.toStringAsFixed(0)}",
            style: TextStyle(color: Colors.green[700], fontSize: 50),
          );
        });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
