import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_app/app/modules/character/character_controller.dart';
import 'package:marvel_app/app/shared/components/loading.dart';
import 'package:marvel_app/app/shared/models/character.dart';
import 'package:marvel_app/app/shared/models/thumbnail.dart';

class CharacterPage extends StatefulWidget {
  final ModularArguments arguments;

  const CharacterPage({Key key, this.arguments}) : super(key: key);

  @override
  _CharacterPageState createState() =>
      _CharacterPageState(int.parse(arguments.params['id']), character: arguments.data);
}

class _CharacterPageState extends ModularState<CharacterPage, CharacterController> {

  _CharacterPageState(int id, {Character character}){
    controller.init(id, character);
  }

  @override
  void initState() {
    super.initState();
    // sincroniza personagem.
    controller.getCharacter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Observer(
          builder: (_) => Loading(
            loading: controller.loading,
            child: _body(),
          ),
        ),
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
}
