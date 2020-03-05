import 'package:flutter/material.dart';

class TestKeyboardPage extends StatefulWidget {
  @override
  _TestKeyboardPageState createState() => _TestKeyboardPageState();
}

class _TestKeyboardPageState extends State<TestKeyboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(child: TextField(keyboardType: TextInputType.datetime))
        ],
      ),
    );
  }
}
