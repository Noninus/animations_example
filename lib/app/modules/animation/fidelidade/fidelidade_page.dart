import 'package:animations_example/app/modules/animation/fidelidade/ponto_fidelidade.dart';
import 'package:flutter/material.dart';

class FidelidadePage extends StatefulWidget {
  @override
  _CardsAliveState createState() => _CardsAliveState();
}

class _CardsAliveState extends State<FidelidadePage>
    with TickerProviderStateMixin {
  AnimationController animationController;
  @override
  void initState() {
    animationController = AnimationController(
        duration: Duration(milliseconds: 1000), vsync: this);
    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        animationController.forward();
      }
    });
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
    return Scaffold(
        appBar: AppBar(
          title: Text("Pontos animados"),
        ),
        body: Center(
            child: Column(
          children: <Widget>[
            Expanded(child: Container(color: Colors.white70)),
            Expanded(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 5,
                    color: Colors.red,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.info),
                          onPressed: () => print('a'),
                        )
                      ]),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: <Widget>[
                        Text(
                          '2 PONTOS FIDELIDADE',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                              fontSize: 32),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              Expanded(child: PontoFidelidade(value: true)),
                              Expanded(child: PontoFidelidade(value: true)),
                              Expanded(child: PontoFidelidade()),
                              Expanded(child: PontoFidelidade()),
                              Expanded(child: PontoFidelidade()),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              Expanded(child: PontoFidelidade()),
                              Expanded(child: PontoFidelidade()),
                              Expanded(child: PontoFidelidade()),
                              Expanded(child: PontoFidelidade()),
                              Expanded(child: PontoFidelidade()),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        )));
  }
}
