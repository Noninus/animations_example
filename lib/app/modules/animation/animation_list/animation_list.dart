import 'package:animations_example/app/modules/animation/components/animated_list.dart';
import 'package:flutter/material.dart';

class AnimationList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Lista Animada"),
        ),
        body: AnimatedListItens());
  }
}
