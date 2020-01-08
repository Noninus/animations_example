import 'package:flutter/material.dart';

class AnimatedItem extends StatefulWidget {
  final int index;

  const AnimatedItem({Key key, this.index}) : super(key: key);
  @override
  _AnimatedItemState createState() => _AnimatedItemState();
}

class _AnimatedItemState extends State<AnimatedItem>
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
          child: Card(
            elevation: 8,
            margin: EdgeInsets.all(8),
            child: ListTile(
              title: Text("${widget.index}"),
              subtitle: Text("Subtitle ${widget.index}"),
              trailing: Icon(Icons.chevron_right),
            ),
          ),
        );
      },
    );
  }
}
