import 'package:flutter/material.dart';

class StaggerAnimation extends StatelessWidget {
  StaggerAnimation({Key key, this.buttonController})
      : buttonSqueezeanimation = Tween(
          begin: 320.0,
          end: 70.0,
        ).animate(
          CurvedAnimation(
            parent: buttonController,
            curve: Interval(
              0.0,
              0.150,
            ),
          ),
        ),
        buttomZoomOut = Tween(
          begin: 70.0,
          end: 1000.0,
        ).animate(
          CurvedAnimation(
            parent: buttonController,
            curve: Interval(
              0.550,
              0.999,
              curve: Curves.bounceOut,
            ),
          ),
        ),
        containerCircleAnimation = EdgeInsetsTween(
          begin: const EdgeInsets.only(bottom: 50.0),
          end: const EdgeInsets.only(bottom: 0.0),
        ).animate(
          CurvedAnimation(
            parent: buttonController,
            curve: Interval(
              0.500,
              0.800,
              curve: Curves.ease,
            ),
          ),
        ),
        super(key: key);

  final AnimationController buttonController;
  final Animation<EdgeInsets> containerCircleAnimation;
  final Animation buttonSqueezeanimation;
  final Animation buttomZoomOut;

  Widget _buildAnimation(BuildContext context, Widget child) {
    return Padding(
      padding: buttomZoomOut.value == 70
          ? const EdgeInsets.only(bottom: 50.0)
          : containerCircleAnimation.value,
      child: InkWell(
          onTap: () => buttonController.forward(),
          child: Hero(
            tag: "fade",
            child: buttomZoomOut.value <= 300
                ? Container(
                    width: buttomZoomOut.value == 70
                        ? buttonSqueezeanimation.value
                        : buttomZoomOut.value,
                    height:
                        buttomZoomOut.value == 70 ? 60.0 : buttomZoomOut.value,
                    alignment: FractionalOffset.center,
                    decoration: BoxDecoration(
                      color: Color(0xFFFF6700),
                      borderRadius: buttomZoomOut.value < 400
                          ? BorderRadius.all(const Radius.circular(30.0))
                          : BorderRadius.all(const Radius.circular(0.0)),
                    ),
                    child: buttonSqueezeanimation.value > 250
                        ? Text(
                            "Resgatar recompensa",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w300,
                              letterSpacing: 0.3,
                            ),
                          )
                        : buttomZoomOut.value < 300.0
                            ? CircularProgressIndicator(
                                value: null,
                                strokeWidth: 1.0,
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.white),
                              )
                            : null)
                : Container(
                    color: Color(0xFFFF6700),
                    child: SafeArea(
                      child: Container(
                        width: buttomZoomOut.value,
                        height: buttomZoomOut.value,
                        decoration: BoxDecoration(
                            shape: buttomZoomOut.value < 500
                                ? BoxShape.circle
                                : BoxShape.rectangle,
                            color: Color(0xFFFF6700)),
                        child: Stack(
                          children: <Widget>[
                            Center(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Expanded(
                                    flex: 3,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Icon(Icons.check_circle,
                                              size: buttomZoomOut.value / 6,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          'Sucesso!',
                                          style: TextStyle(
                                              fontSize: 32,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          'Você conseguiu resgatar seu cupom de R\$10,00! Aproveite em sua proxima compra',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Spacer(),
                                            Expanded(
                                              flex: 3,
                                              child: RaisedButton(
                                                  padding: EdgeInsets.all(16),
                                                  color: Colors.white,
                                                  child: Text(
                                                    "PRONTO",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFFFF6700)),
                                                  ),
                                                  onPressed: () =>
                                                      Navigator.pop(context)),
                                            ),
                                            Spacer(),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: buttonController,
    );
  }
}
