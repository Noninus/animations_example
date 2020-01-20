import 'package:flutter/material.dart';

class NubankPage extends StatefulWidget {
  @override
  _NubankPageState createState() => _NubankPageState();
}

class _NubankPageState extends State<NubankPage>
    with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController animationController;
  @override
  void initState() {
    animationController =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    animation = Tween<double>(begin: -1, end: 0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.elasticOut));

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
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Spacer(flex: 1),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[Icon(Icons.nature), Text('Rafael')],
          ),
          AnimatedBuilder(
            animation: animationController,
            builder: (BuildContext context, Widget child) {
              return Expanded(
                flex: 5,
                child: Transform(
                  transform: Matrix4.translationValues(
                      (animation.value * width), 0.0, 0.0),
                  child: Column(
                    children: <Widget>[
                      Expanded(
                          flex: 3,
                          child: Container(
                            padding: const EdgeInsets.all(32),
                            width: width,
                            child: Card(
                              child: Column(
                                children: <Widget>[],
                              ),
                            ),
                          )),
                      Expanded(
                          child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(8),
                            width: 100,
                            child: Card(
                              color: Colors.deepPurple,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Icon(Icons.terrain),
                                  Text('Viajar')
                                ],
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8),
                            width: 100,
                            child: Card(
                              color: Colors.deepPurple,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Icon(Icons.time_to_leave),
                                  Text('Carro')
                                ],
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8),
                            width: 100,
                            child: Card(
                              color: Colors.deepPurple,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Icon(Icons.near_me),
                                  Text('Localização')
                                ],
                              ),
                            ),
                          )
                        ],
                      ))
                    ],
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
