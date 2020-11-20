import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_app/app/modules/character/character_controller.dart';
import 'package:marvel_app/app/modules/character/character_page.dart';
import 'package:marvel_app/app/shared/stores/user_store.dart';

/// It's a local module.
class CharacterModule extends ChildModule {

  // here will be any class you want to inject into your project (eg bloc, dependency)
  @override
  List<Bind> get binds => [
    Bind((i) => CharacterController(
      Modular.get<UserStore>()
    )),
  ];

  // here will be the routes of your module
  @override
  List<Router> get routers => [
    Router("/:id", child: (_, args) => CharacterPage(arguments: args,)),
  ];
}