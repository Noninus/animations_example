import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: RaisedButton(
              child: Text("Animation Item"),
              onPressed: () => Navigator.pushNamed(context, '/animationItem'),
            ),
          ),
          Expanded(
            child: RaisedButton(
              child: Text("Animation List Item"),
              onPressed: () {
                return Navigator.pushNamed(context, '/animationList');
              },
            ),
          ),
          Expanded(
            child: RaisedButton(
              child: Text("Cards alive"),
              onPressed: () {
                return Navigator.pushNamed(context, '/cardsAlive');
              },
            ),
          ),
          Expanded(
            child: RaisedButton(
              child: Text("Nubank"),
              onPressed: () {
                return Navigator.pushNamed(context, '/nubank');
              },
            ),
          ),
          Expanded(
            child: RaisedButton(
              child: Text("Dialog animated"),
              onPressed: () {
                return Navigator.pushNamed(context, '/dialog');
              },
            ),
          )
        ],
      ),
    );
  }
}
