
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_app/app/modules/home/stores/home_access_interface.dart';
import 'package:marvel_app/app/modules/home/stores/home_store.dart';
import 'package:marvel_app/app/shared/models/character.dart';

class HomeAccess implements IHomeAccess {

  final HomeStore _homeStore = Modular.get();

  @override
  Future<void> fetchCharactersList() {
    return _homeStore.fetchCharactersList();
  }

  @override
  List<Character> getCharacters() {
    return _homeStore.getCharacters();
  }

  @override
  void setCharacters(value) {
    _homeStore.setCharacters(value);
  }

}