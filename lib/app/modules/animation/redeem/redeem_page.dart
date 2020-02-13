import 'package:animations_example/app/modules/animation/redeem/animated_confetti.dart';
import 'package:flutter/material.dart';

class RedeemPage extends StatefulWidget {
  @override
  _NubankPageState createState() => _NubankPageState();
}

class _NubankPageState extends State<RedeemPage>
    with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController animationController;
  @override
  void initState() {
    animationController = AnimationController(
        duration: Duration(seconds: 1),
        reverseDuration: Duration(milliseconds: 500),
        vsync: this);
    animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastLinearToSlowEaseIn));

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  _showDialog(context) {
    animationController.reset();
    animationController.forward();
    animationController.duration = Duration(seconds: 1);

    return showDialog(
        context: context,
        builder: (_) {
          return AnimatedBuilder(
              animation: animationController,
              builder: (BuildContext context, Widget child) {
                return WillPopScope(
                  onWillPop: () async {
                    await animationController.reverse();

                    return true;
                  },
                  child: Transform.scale(
                    scale: animation.value,
                    child: Dialog(
                      child: Container(
                          height: 400,
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  color: Colors.yellow,
                                ),
                              ),
                              Expanded(
                                  flex: 3,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      AnimatedConfetti(),
                                      Text(
                                          "Ganhe o triplo de recompensas em 7 dias"),
                                      RaisedButton(
                                        child: Text("R\$ 3,90"),
                                        onPressed: () {},
                                      )
                                    ],
                                  ))
                            ],
                          )),
                    ),
                  ),
                );
              });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Redeem button")),
        body: Center(
          child: Row(
            children: <Widget>[
              Expanded(
                  child: Container(
                margin: EdgeInsets.all(24),
                height: 50.0,
                decoration: BoxDecoration(color: Color(0xFFFF6700), boxShadow: [
                  BoxShadow(
                    color: Colors.grey[500],
                    offset: Offset(1.1, 2.5),
                    blurRadius: 1.5,
                  ),
                ]),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                      onTap: () => _showDialog(context),
                      child: Center(
                        child: Text(
                          'Resgatar cupom',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      )),
                ),
              ))
            ],
          ),
        ));
  }
}
