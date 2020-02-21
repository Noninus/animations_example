import 'package:flutter/material.dart';

class RestauranteCardExtended extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final double begin;
  final double end;
  const RestauranteCardExtended(
      {Key key,
      this.child,
      this.duration = const Duration(seconds: 1),
      this.begin = 1.0,
      this.end = 0})
      : super(key: key);
  @override
  RestauranteCardExtendedState createState() => RestauranteCardExtendedState();
}

class RestauranteCardExtendedState extends State<RestauranteCardExtended>
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
      curve: Curves.bounceOut,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, Widget child) {
          return InkWell(
            onTap: () {
              if (_controller.status != AnimationStatus.completed) {
                _controller.forward();
              } else {
                _controller.reverse();
              }
            },
            child: Container(
                height: _animation.value,
                color: Color(0xFFeaeaea),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _controller.status != AnimationStatus.completed
                        ? Container()
                        : Column(children: <Widget>[
                            Text('Pedido minimo: R\$10,00')
                          ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          _controller.status != AnimationStatus.completed
                              ? Icon(Icons.keyboard_arrow_down)
                              : Icon(Icons.keyboard_arrow_up)
                        ]),
                  ],
                )),
          );
        });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
