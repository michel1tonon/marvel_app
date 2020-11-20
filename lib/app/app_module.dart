import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_app/app/modules/character/character_module.dart';
import 'package:marvel_app/app/modules/home/home_module.dart';
import 'package:marvel_app/app/shared/constants/modules_constant.dart';
import 'package:marvel_app/app/shared/stores/user_store.dart';
import 'app_widget.dart';

/// It's a global module. Accessed in the project.
class AppModule extends MainModule {

  // here will be any class you want to inject into your project
  // (eg bloc, dependency)
  @override
  List<Bind> get binds => [
    Bind((_) => UserStore()),
  ];

  // here will be the routes of your module
  @override
  List<Router> get routers => [
    // HOME
    Router("/$HOME",  module: HomeModule(), transition: TransitionType.fadeIn),

    // CHARACTER
    Router("/$CHARACTER",
                 module: CharacterModule(), transition: TransitionType.fadeIn),
  ];

  // add your main widget here
  @override
  Widget get bootstrap => AppWidget();
}