import 'package:animations_example/app/modules/animation/animated_page/animated_page.dart';
import 'package:animations_example/app/modules/animation/animation_item/animation_item.dart';
import 'package:animations_example/app/modules/animation/animation_list/animation_list.dart';
import 'package:animations_example/app/modules/animation/background/background_color_page.dart';
import 'package:animations_example/app/modules/animation/cardclick/cardclick_page.dart';
import 'package:animations_example/app/modules/animation/cards_alive/cards_alive.dart';
import 'package:animations_example/app/modules/animation/clap/clap_widget.dart';
import 'package:animations_example/app/modules/animation/dialog_animated.dart/dialog_animated.dart';
import 'package:animations_example/app/modules/animation/fidelidade/fidelidade_page.dart';
import 'package:animations_example/app/modules/animation/nubank/nubank_page.dart';
import 'package:animations_example/app/modules/animation/redeem/redeem_page.dart';
import 'package:animations_example/app/modules/animation/restaurante/restaurante_page.dart';
import 'package:animations_example/app/modules/animation/test_keyboard/test_keyboard.dart';
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
        Router('/clap', child: (_, args) => ClapWidget()),
        Router('/background', child: (_, args) => BackGroundColorPage()),
        Router('/fidelidade', child: (_, args) => FidelidadePage()),
        Router('/redeem', child: (_, args) => RedeemPage()),
        Router('/animated_fidelidade',
            child: (_, args) => AnimatedFidelidadePage()),
        Router('/restaurante', child: (_, args) => RestaurantePage()),
        Router('/cardclick', child: (_, args) => CardClickPage()),
        Router('/keyboardtest', child: (_, args) => TestKeyboardPage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
