import 'package:flutter/material.dart';

class DetailsFidelidade extends StatefulWidget {
  @override
  _DetailsFidelidadeState createState() => _DetailsFidelidadeState();
}

class _DetailsFidelidadeState extends State<DetailsFidelidade> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        backgroundColor: Colors.white10,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Center(
            child: new Container(
              margin: EdgeInsets.all(8),
              width: 320.0,
              height: 60.0,
              alignment: FractionalOffset.center,
              decoration: new BoxDecoration(
                color: const Color(0xFFFF6700),
                borderRadius: new BorderRadius.all(const Radius.circular(30.0)),
              ),
              child: new Text(
                "Resgatar Recompensa",
                style: new TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w300,
                  letterSpacing: 0.3,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
