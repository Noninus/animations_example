import 'package:flutter/material.dart';

class RewardButton extends StatefulWidget {
  final height;

  const RewardButton({Key key, this.height}) : super(key: key);
  @override
  _RewardButtonState createState() => _RewardButtonState();
}

class _RewardButtonState extends State<RewardButton>
    with TickerProviderStateMixin {
  AnimationController _loginButtonController;
  Animation buttonSqueezeAnimation;
  Animation buttonZoomOut;

  void initState() {
    super.initState();
    _loginButtonController = new AnimationController(
        duration: new Duration(milliseconds: 3000), vsync: this);

    buttonSqueezeAnimation = new Tween(
      begin: 320.0,
      end: 70.0,
    ).animate(new CurvedAnimation(
        parent: _loginButtonController, curve: new Interval(0.0, 0.250)));

    buttonZoomOut = new Tween(
      begin: 70.0,
      end: widget.height,
    ).animate(new CurvedAnimation(
      parent: _loginButtonController,
      curve: new Interval(
        0.550,
        0.900,
        curve: Curves.linearToEaseOut,
      ),
    ));
  }

  Future<Null> _playAnimation() async {
    try {
      await _loginButtonController.forward();
    } on TickerCanceled {}
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _loginButtonController,
      builder: (BuildContext context, Widget child) {
        if (buttonZoomOut.value == widget.height) {
          return Expanded(
            child: Container(
              color: Color(0xFFFF6700),
              child: Center(
                child: SafeArea(
                  child: Stack(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          IconButton(
                              icon: Icon(Icons.close),
                              onPressed: () async =>
                                  _loginButtonController.reverse()),
                        ],
                      ),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.check_circle_outline, size: 100),
                            Text("Cupom resgatado com sucesso!")
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        }
        return Center(
            child: InkWell(
          onTap: () {
            _playAnimation();
          },
          child: new Container(
              width: buttonZoomOut.value == 70
                  ? buttonSqueezeAnimation.value
                  : buttonZoomOut.value,
              height: buttonZoomOut.value == 70 ? 60.0 : buttonZoomOut.value,
              alignment: FractionalOffset.center,
              decoration: new BoxDecoration(
                  color: Color(0xFFFF6700),
                  borderRadius: buttonZoomOut.value == 70
                      ? BorderRadius.all(const Radius.circular(30.0))
                      : null),
              child: buttonSqueezeAnimation.value > 75.0
                  ? new Text(
                      "Sign In",
                      style: new TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    )
                  : buttonZoomOut.value < 300.0
                      ? new CircularProgressIndicator(
                          valueColor:
                              new AlwaysStoppedAnimation<Color>(Colors.white),
                        )
                      : null),
        ));
      },
    );
  }
}
