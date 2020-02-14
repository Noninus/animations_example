import 'package:animations_example/app/modules/animation/animated_page/components/easing_widget.dart';
import 'package:flutter/material.dart';

class AnimatedFidelidadePage extends StatefulWidget {
  @override
  _AnimatedFidelidadePageState createState() => _AnimatedFidelidadePageState();
}

class _AnimatedFidelidadePageState extends State<AnimatedFidelidadePage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(color: Color(0xFFFF6700), boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 10, // has the effect of softening the shadow
                    spreadRadius: 2, // has the effect of extending the shadow
                  )
                ]),
                height: height * 0.2,
                child: Center(
                  child: Text(
                    "Meus pontos",
                    style: TextStyle(color: Colors.white, fontSize: 32),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height * 0.125),
                child: Center(
                  child: Container(
                    height: height * 0.125,
                    width: width * 0.7,
                    child: EasingAnimationWidget(
                      child: Card(
                        elevation: 10,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Image.asset(
                              'assets/coupon.png',
                              height: 72,
                            ),
                            Row(
                              textBaseline: TextBaseline.alphabetic,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              children: <Widget>[
                                Text(
                                  "67",
                                  style: TextStyle(
                                      color: Colors.green[700], fontSize: 50),
                                ),
                                Text(
                                  "pts.",
                                  style: TextStyle(
                                      color: Colors.green[700], fontSize: 32),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          Container(
            height: height * 0.125,
            child: EasingAnimationWidget(
              begin: -1,
              duration: Duration(seconds: 2),
              child: Row(
                children: <Widget>[
                  Expanded(child: CircleAvatar()),
                  Expanded(
                      child: CircleAvatar(
                    child: Icon(Icons.add_shopping_cart),
                  )),
                  Expanded(child: CircleAvatar()),
                ],
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                "Prêmios",
                style: TextStyle(fontSize: 32),
              )),
          Expanded(
              child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ListTile(
                  title: Text('teste $index'),
                ),
              );
            },
            itemCount: 20,
          ))
        ],
      ),
    );
  }
}
