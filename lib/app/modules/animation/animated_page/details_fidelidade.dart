import 'package:flutter/material.dart';

import 'components/reward_button.dart';

class DetailsFidelidade extends StatefulWidget {
  @override
  _DetailsFidelidadeState createState() => _DetailsFidelidadeState();
}

class _DetailsFidelidadeState extends State<DetailsFidelidade> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          BackButton(),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              RewardButton(height: height),
            ],
          )
        ],
      ),
    );
  }
}
