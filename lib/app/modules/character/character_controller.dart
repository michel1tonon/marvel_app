import 'package:marvel_app/app/modules/character/character_store.dart';
import 'package:marvel_app/app/shared/models/character.dart';
import 'package:mobx/mobx.dart';
part 'character_controller.g.dart';

class CharacterController = _CharacterController with _$CharacterController;

// flutter packages pub run build_runner build
abstract class _CharacterController with Store {

  int id;

  @observable
  bool loading = false;

  final CharacterStore _characterStore;

  // construct with store
  _CharacterController(this._characterStore);

  // init values.
  void init(int id, Character character) {
    // mode dev (web)
    if(this.id != null) return;

    this.id = id;
    if(character != null) {
      _characterStore.setCharacter(character);
    }
  }

  // Sync list of characters
  // obs: controller can handle pagination
  Future<void> getCharacter() async {
    // mode dev (web)
    if(loading) return;

    // if not exists a character
    if(_characterStore.character == null) {
      setLoading(true);
      await _characterStore.getCharacter(id);
      setLoading(false);
    }
  }

  @action
  setLoading(value){
    this.loading = value;
  }

  Character get character {
    return _characterStore.character;
  }

}