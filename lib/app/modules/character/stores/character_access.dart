
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_app/app/modules/character/stores/character_access_interface.dart';
import 'package:marvel_app/app/modules/character/stores/character_store.dart';
import 'package:marvel_app/app/shared/models/character.dart';

class CharacterAccess implements ICharacterAccess {

  final CharacterStore _characterStore = Modular.get();

  @override
  Character getCharacter() {
    return _characterStore.getCharacter();
  }

  @override
  void setCharacter(value) {
    _characterStore.setCharacter(value);
  }

  @override
  Future<void> fetchCharacter(int id) {
    return _characterStore.fetchCharacter(id);
  }

}