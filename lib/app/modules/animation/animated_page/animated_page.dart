import 'package:animations_example/app/modules/animation/animated_page/components/animated_text.dart';
import 'package:animations_example/app/modules/animation/animated_page/components/easing_widget.dart';
import 'package:animations_example/app/modules/animation/animated_page/components/easing_widget_top.dart';
import 'package:flutter/material.dart';

import 'components/fidelidade_card.dart';

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
                    blurRadius: 10,
                    spreadRadius: 2,
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
                    height: height * 0.15,
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
                                AnimatedTextWidget(begin: 134, end: 34),
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
          Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
              child: EasingAnimationWidget(
                begin: -1,
                duration: Duration(seconds: 1),
                child: Text(
                  "Prêmios",
                  style: TextStyle(fontSize: 32),
                ),
              )),
          Expanded(
              child: EasingAnimationWidgetTop(
            duration: Duration(seconds: 3),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                return FidelidadeCard();
              },
            ),
          ))
        ],
      ),
    );
  }
}
