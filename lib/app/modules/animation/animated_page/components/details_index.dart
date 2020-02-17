import 'package:animations_example/app/modules/animation/animated_page/components/resgatar_animator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/animation.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);
  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  AnimationController _loginButtonController;
  var animationStatus = 0;
  @override
  void initState() {
    super.initState();
    _loginButtonController = AnimationController(
        duration: Duration(milliseconds: 3000), vsync: this);
  }

  @override
  void dispose() {
    _loginButtonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: BackButton(),
                  )
                ]),
                Column(
                  children: <Widget>[
                    Text(
                      'R\$10,00 de desconto',
                      style: TextStyle(color: Colors.black54, fontSize: 34),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Apenas ', style: TextStyle(fontSize: 24)),
                        Text(
                          '100 pontos',
                          style: TextStyle(color: Colors.green, fontSize: 24),
                        )
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Descrição', style: TextStyle(fontSize: 20)),
                      Text(
                          'Cupom de desconto de R\$10,00 para pedir tanto no app quanto no estabelecimento',
                          style:
                              TextStyle(fontSize: 20, color: Colors.black54)),
                      SizedBox(height: 10),
                      Text('Termos & Condições',
                          style: TextStyle(fontSize: 20)),
                      Text('Disponível até dia 21/01/2021',
                          style:
                              TextStyle(fontSize: 20, color: Colors.black54)),
                    ],
                  ),
                ),
                SizedBox()
              ],
            ),
            animationStatus == 0
                ? Padding(
                    padding: EdgeInsets.only(bottom: height * 0.05),
                    child: InkWell(
                        onTap: () {
                          setState(() {
                            animationStatus = 1;
                          });
                          _loginButtonController.forward();
                        },
                        child: Container(
                          width: 320.0,
                          height: 60.0,
                          alignment: FractionalOffset.center,
                          decoration: BoxDecoration(
                            color: Color(0xFFFF6700),
                            borderRadius:
                                BorderRadius.all(const Radius.circular(30.0)),
                          ),
                          child: Text(
                            "Resgatar cupom",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w300,
                              letterSpacing: 0.3,
                            ),
                          ),
                        )),
                  )
                : StaggerAnimation(
                    buttonController: _loginButtonController.view),
          ],
        ),
      ),
    );
  }
}
