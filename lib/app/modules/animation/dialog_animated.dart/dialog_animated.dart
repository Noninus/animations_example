import 'package:flutter/material.dart';

class DialogAnimatedPage extends StatefulWidget {
  @override
  _NubankPageState createState() => _NubankPageState();
}

class _NubankPageState extends State<DialogAnimatedPage>
    with SingleTickerProviderStateMixin {
  Animation animation;
  Animation animationDispose;
  AnimationController animationController;
  bool current = true;
  @override
  void initState() {
    animationController =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    animation = Tween<double>(begin: -1, end: 0).animate(CurvedAnimation(
        parent: animationController, curve: Curves.linearToEaseOut));
    animationDispose = Tween<double>(begin: 0, end: 0.8).animate(
        CurvedAnimation(
            parent: animationController, curve: Curves.linearToEaseOut));

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  _showDialog(context) {
    final height = MediaQuery.of(context).size.height;
    animationController.reset();
    animationController.forward();
    current = true;
    animationController.duration = Duration(seconds: 1);

    return showDialog(
        context: context,
        builder: (_) {
          return AnimatedBuilder(
              animation: animationController,
              builder: (BuildContext context, Widget child) {
                Animation currentAnimation =
                    current ? animation : animationDispose;

                return WillPopScope(
                  onWillPop: () async {
                    current = false;
                    animationController.duration = Duration(milliseconds: 500);
                    animationController.reset();
                    await animationController.forward();
                    return true;
                  },
                  child: Transform(
                    transform: Matrix4.translationValues(
                        0.0, (currentAnimation.value * height), 0.0),
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
                                      Text("Frasco de Elixir Solar"),
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
        body: Center(
      child: RaisedButton(
        child: Text('Show dialog'),
        onPressed: () => _showDialog(context),
      ),
    ));
  }
}
