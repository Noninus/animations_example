import 'package:animations_example/app/modules/animation/animation_item/animation_item.dart';
import 'package:animations_example/app/modules/animation/animation_list/animation_list.dart';
import 'package:animations_example/app/modules/animation/cards_alive/cards_alive.dart';
import 'package:animations_example/app/modules/animation/dialog_animated.dart/dialog_animated.dart';
import 'package:animations_example/app/modules/animation/nubank/nubank_page.dart';
import 'package:animations_example/app/modules/home/home_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:animations_example/app/modules/home/home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeBloc()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => HomePage()),
        Router('/animationItem', child: (_, args) => AnimationItemList()),
        Router('/animationList', child: (_, args) => AnimationList()),
        Router('/cardsAlive', child: (_, args) => CardsAlive()),
        Router('/nubank', child: (_, args) => NubankPage()),
        Router('/dialog', child: (_, args) => DialogAnimatedPage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
