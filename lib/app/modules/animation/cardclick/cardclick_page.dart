import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

class CardClickPage extends StatefulWidget {
  @override
  _CardClickPageState createState() => _CardClickPageState();
}

class _CardClickPageState extends State<CardClickPage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: <Widget>[
            Expanded(
                child: InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          Page2(color: Colors.green))),
              child: Hero(
                tag: '1',
                child: Card(
                  color: Colors.green,
                  child: Center(child: Text('a')),
                ),
              ),
            )),
            Expanded(
                child: Card(
              color: Colors.red,
              child: Center(child: Text('b')),
            )),
            Expanded(
                child: Card(
              color: Colors.yellow,
              child: Center(child: Text('c')),
            )),
          ],
        ));
  }
}

class Page2 extends StatefulWidget {
  final Color color;

  const Page2({Key key, this.color}) : super(key: key);

  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> with SingleTickerProviderStateMixin {
  ScrollController scrollController;
  Animation animation;
  AnimationController animationController;
  @override
  void initState() {
    animationController =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    animation = Tween<double>(begin: 1, end: 0.9).animate(
        CurvedAnimation(parent: animationController, curve: Curves.elasticOut));

    SystemChrome.setEnabledSystemUIOverlays([]);
    scrollController = ScrollController();

    scrollController.addListener(_scrollListener);
    super.initState();
  }

  _scrollListener() async {
    if (scrollController.offset < 0) {
      if (scrollController.offset < -25) {
        await animationController.forward();

        Navigator.pop(context);
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
        tag: '1',
        child: AnimatedBuilder(
            animation: animationController,
            builder: (BuildContext context, Widget child) {
              return Transform.scale(
                  scale: animation.value,
                  child: ListView(
                    controller: scrollController,
                    children: <Widget>[
                      Container(
                        color: Colors.green,
                        child:
                            Text('aasdasdmanjfdgfjisnkejnkejnewofmofm ofm k'),
                        width: 200,
                        height: 600,
                      ),
                      Container(
                        color: Colors.green,
                        width: 200,
                        height: 600,
                      )
                    ],
                  ));
            }),
      ),
    );
  }
}
