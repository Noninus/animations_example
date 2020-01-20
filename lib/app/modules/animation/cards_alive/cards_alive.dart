import 'package:flutter/material.dart';

class CardsAlive extends StatefulWidget {
  @override
  _CardsAliveState createState() => _CardsAliveState();
}

class _CardsAliveState extends State<CardsAlive> with TickerProviderStateMixin {
  Animation animation;
  Animation animationInverse;
  AnimationController animationController;
  @override
  void initState() {
    animationController =
        AnimationController(duration: Duration(milliseconds: 750), vsync: this);
    animation = Tween<double>(begin: .05, end: 0).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));
    animationInverse = Tween<double>(begin: -.05, end: 0).animate(
        CurvedAnimation(
            parent: animationController, curve: Curves.fastOutSlowIn));
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
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: Text("Cartões vivos"),
        ),
        body: Column(children: [
          Text('Qualquer titulo'),
          Expanded(
              child: Stack(
            children: <Widget>[
              AnimatedBuilder(
                animation: animationController,
                builder: (BuildContext context, Widget child) {
                  return Positioned(
                      left: 30,
                      right: 30,
                      top: 30,
                      child: Transform(
                        transform: Matrix4.translationValues(
                            0.0, (animation.value * height), 0.0),
                        child: Card(
                          elevation: 10,
                          child: Container(
                            height: 300,
                            width: 300,
                            color: Colors.red,
                          ),
                        ),
                      ));
                },
              ),
              Positioned(
                  left: 30,
                  right: 30,
                  top: 60,
                  child: Card(
                    elevation: 20,
                    child: Container(
                      height: 300,
                      width: 300,
                      color: Colors.yellow,
                    ),
                  )),
              AnimatedBuilder(
                animation: animationController,
                builder: (BuildContext context, Widget child) {
                  return Positioned(
                      left: 30,
                      right: 30,
                      top: 90,
                      child: Transform(
                        transform: Matrix4.translationValues(
                            0.0, (animationInverse.value * height), 0.0),
                        child: Card(
                          elevation: 30,
                          child: Container(
                            height: 300,
                            width: 300,
                            color: Colors.green,
                          ),
                        ),
                      ));
                },
              ),
            ],
          )),
        ]));
  }
}
