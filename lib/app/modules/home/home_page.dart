import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_app/app/modules/home/components/character_tile.dart';
import 'package:marvel_app/app/modules/home/home_controller.dart';
import 'package:marvel_app/app/modules/home/home_store.dart';
import 'package:marvel_app/app/shared/components/loading.dart';
import 'package:marvel_app/app/shared/components/future_observer.dart';
import 'package:marvel_app/app/shared/constants/modules_constant.dart';
import 'package:marvel_app/app/shared/helpers/nav.dart';
import 'package:marvel_app/app/shared/models/character.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  final HomeStore _homeStore = Modular.get<HomeStore>();

  @override
  void initState() {
    super.initState();
    // sincroniza a lista de personagens.
    controller.getCharactersList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureObserver(
        builder: (_) => Loading(
          loading: controller.loading,
          child: _body(),
        )
      ),
    );
  }

  Widget _body() {
    return ListView(
      children: _homeStore.characters
          .map((character) => CharacterTile(
            character: character,
            onTap: onTap,
          )).toList(),
    );
  }

  /// ////////////////////////////////////////////////////////////////////////
  /// EVENTS
  /// ////////////////////////////////////////////////////////////////////////

  void onTap(Character character) {
    pushNamed("/$CHARACTER/${character.id}", arguments: character);
  }
}
