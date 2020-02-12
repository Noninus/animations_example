import 'dart:math';

import 'package:flutter/material.dart';

class PontoFidelidade extends StatefulWidget {
  final bool value;

  const PontoFidelidade({Key key, this.value = false}) : super(key: key);
  @override
  _PontoFidelidadeState createState() => _PontoFidelidadeState();
}

class _PontoFidelidadeState extends State<PontoFidelidade>
    with TickerProviderStateMixin {
  AnimationController animationController;
  @override
  void initState() {
    animationController = AnimationController(
        duration: Duration(milliseconds: widget.value ? 1000 : 500),
        vsync: this);
    animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: AnimatedBuilder(
          animation: animationController,
          builder: (context, child) {
            return Transform.scale(
                scale: animationController.value,
                child: Container(
                  decoration: widget.value
                      ? BoxDecoration(boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 0),
                            spreadRadius: -15,
                            blurRadius: 10,
                          )
                        ])
                      : null,
                  child: Opacity(
                    opacity: widget.value ? 1 : 0.3,
                    child: GestureDetector(
                      onTap: widget.value
                          ? () {
                              animationController.value = Random().nextDouble();
                              animationController.forward();
                            }
                          : null,
                      child: Image.asset(
                        'assets/pizza.png',
                      ),
                    ),
                  ),
                ));
          }),
    );
  }
}
