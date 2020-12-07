import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_app/app/environment.dart';
import 'package:marvel_app/app/modules/home/home_controller.dart';
import 'package:marvel_app/app/modules/home/home_page.dart';
import 'package:marvel_app/app/modules/home/home_store.dart';
import 'package:marvel_app/app/modules/home/repositories/home_repository.dart';
import 'package:marvel_app/app/modules/home/repositories/home_repository_interface.dart';

/// It's a local module.
class HomeModule extends ChildModule {

  // here will be any class you want to inject into your project
  // (eg bloc, dependency)
  @override
  List<Bind> get binds => [
    Bind<IHomeRepository>((_) => HomeRepository(Modular.get<Environment>())),
    Bind((i) => HomeStore(i.get<IHomeRepository>())),
    Bind((i) => HomeController(i.get<HomeStore>())),
  ];

  // here will be the routes of your module
  @override
  List<Router> get routers => [
    Router("/", child: (_, args) => HomePage()),
  ];
}