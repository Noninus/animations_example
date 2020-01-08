import 'package:flutter/material.dart';

class AnimatedListItens extends StatefulWidget {
  @override
  _AnimatedListItensState createState() => _AnimatedListItensState();
}

class _AnimatedListItensState extends State<AnimatedListItens>
    with TickerProviderStateMixin {
  Animation animation;
  AnimationController animationController;
  @override
  void initState() {
    animationController =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this);
    animation = Tween<double>(begin: -1, end: 0).animate(CurvedAnimation(
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
                    title: Text("$index"),
                    subtitle: Text("Subtitle $index"),
                    trailing: Icon(Icons.chevron_right),
                  ),
                );
              },
              itemCount: 20,
            ));
      },
    );
  }
}
