import 'package:animations_example/app/shared/components/fade_route.dart';
import 'package:flutter/material.dart';

import 'details_index.dart';

class FidelidadeCard extends StatelessWidget {
  const FidelidadeCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(context, FadeRoute(page: LoginScreen())),
      child: Card(
        margin: EdgeInsets.only(top: 10, bottom: 10, left: 16, right: 16),
        elevation: 6,
        child: Padding(
          padding: const EdgeInsets.only(top: 12, bottom: 12),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 4,
                child: ListTile(
                    title: Text(
                      'R\$10,00 de desconto',
                      style: TextStyle(fontSize: 20),
                    ),
                    subtitle: Text(
                      'na sua compra',
                      style: TextStyle(fontSize: 18),
                    )),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(color: Colors.green, boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 3, // has the effect of softening the shadow
                      spreadRadius: 1, // has the effect of extending the shadow
                    )
                  ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '100',
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      ),
                      Text(
                        'pts',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
