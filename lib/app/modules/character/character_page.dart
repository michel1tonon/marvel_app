import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_app/app/modules/character/character_controller.dart';
import 'package:marvel_app/app/shared/components/future_observer.dart';
import 'package:marvel_app/app/shared/components/loading.dart';
import 'package:marvel_app/app/shared/models/character.dart';
import 'package:marvel_app/app/shared/models/thumbnail.dart';

class CharacterPage extends StatefulWidget {
  final ModularArguments arguments;

  const CharacterPage({Key key, this.arguments}) : super(key: key);

  @override
  _CharacterPageState createState() =>
      _CharacterPageState(character: arguments.data);
}

class _CharacterPageState extends ModularState<CharacterPage, CharacterController> {

  _CharacterPageState({Character character}){
    controller.setCharacter(character);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: false,
        child: Stack(

          children: [
            // body
            _body(),

            // appBar, back button
            AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
            ),
          ],
        )
      ),
    );
  }

  Widget _body() {
    return controller.character != null ? ListView(
      padding: EdgeInsets.zero,
      children: [
        // Image
        _image(),

        // Title
        _title(),

        // Description
        _description(),

        _userName()
      ],
    ): Container();
  }

  Widget _image() {
    Thumbnail thumb = controller.character.thumbnail;
    return Hero(
      tag: "${controller.character.id}",
      child: Image.network("${thumb.path}.${thumb.extension}"),
    );
  }

  Widget _title() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Text(
        controller.character.name,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _description() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        controller.character.description,
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _userName() {
    print("Aqui eu tenho acesso ao conteúdo de usuário sem misturar "
        "regras de negócio");
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      child: Text(
        controller.getUserName(),
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
      ),
    );
  }
}
