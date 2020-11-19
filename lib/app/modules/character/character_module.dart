import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_app/app/modules/character/character_controller.dart';
import 'package:marvel_app/app/modules/character/character_page.dart';
import 'package:marvel_app/app/modules/character/stores/character_store.dart';
import 'package:marvel_app/app/modules/character/repositories/character_repository.dart';
import 'package:marvel_app/app/modules/character/repositories/character_repository_interface.dart';

/// It's a local module.
class CharacterModule extends ChildModule {

  // here will be any class you want to inject into your project (eg bloc, dependency)
  @override
  List<Bind> get binds => [
    Bind<ICharacterRepository>((_) => CharacterRepository()),
    Bind((i) => CharacterStore(i.get<ICharacterRepository>())),
    Bind((i) => CharacterController()),
  ];

  // here will be the routes of your module
  @override
  List<Router> get routers => [
    Router("/:id", child: (_, args) => CharacterPage(arguments: args,)),
  ];
}