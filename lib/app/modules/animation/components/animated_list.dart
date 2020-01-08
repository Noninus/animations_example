import 'package:flutter/material.dart';

class AnimatedListItens extends StatefulWidget {
  @override
  _AnimatedListItensState createState() => _AnimatedListItensState();
}

class _AnimatedListItensState extends State<AnimatedListItens>
    with TickerProviderStateMixin {
  Animation animation;
  AnimationController animationTextController;
  AnimationController animationController;
  @override
  void initState() {
    animationController =
        AnimationController(duration: Duration(milliseconds: 750), vsync: this);
    animation = Tween<double>(begin: -1, end: 0).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));
    animationTextController = AnimationController(
        duration: Duration(milliseconds: 1500), vsync: this);
    animationController.forward();
    animationTextController.forward();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    animationTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return Transform(
            transform:
                Matrix4.translationValues((animation.value * width), 0.0, 0.0),
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 8,
                  margin: EdgeInsets.all(8),
                  child: ListTile(
                    title: AnimatedBuilder(
                      animation: animationTextController,
                      builder: (BuildContext context, Widget child) {
                        return Transform(
                            transform: Matrix4.translationValues(
                                (animation.value * width), 0.0, 0.0),
                            child: Text("$index"));
                      },
                    ),
                    subtitle: Text("Subtitle $index"),
                    trailing: Icon(Icons.chevron_right),
                  ),
                );
              },
              itemCount: 50,
            ));
      },
    );
  }
}
