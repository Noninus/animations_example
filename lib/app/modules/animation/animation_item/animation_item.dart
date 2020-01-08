import 'package:animations_example/app/modules/animation/components/animated_item.dart';
import 'package:flutter/material.dart';

class AnimationItemList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista Animada"),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return AnimatedItem(index: index);
        },
        itemCount: 20,
      ),
    );
  }
}
