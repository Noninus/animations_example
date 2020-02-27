import 'package:flutter/material.dart';

class TesterChanger extends StatefulWidget {
  final ScrollController scrollController;

  const TesterChanger({Key key, this.scrollController}) : super(key: key);
  @override
  _TesterChangerState createState() => _TesterChangerState();
}

class _TesterChangerState extends State<TesterChanger> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => widget.scrollController.animateTo(100.0,
          curve: Curves.easeOut, duration: Duration(seconds: 1)),
      child: ListTile(
        title: Text("mudar"),
        subtitle: Text('mudou'),
      ),
    );
  }
}
