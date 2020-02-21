import 'package:flutter/material.dart';

class TesterChanger extends StatefulWidget {
  final TabController tab;

  const TesterChanger({Key key, this.tab}) : super(key: key);
  @override
  _TesterChangerState createState() => _TesterChangerState();
}

class _TesterChangerState extends State<TesterChanger> {
  @override
  void initState() {
    widget.tab.animateTo(1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("mudar"),
      subtitle: Text('mudou'),
    );
  }
}
