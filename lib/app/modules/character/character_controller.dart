import 'package:marvel_app/app/modules/character/stores/character_access.dart';
import 'package:marvel_app/app/shared/models/character.dart';
import 'package:mobx/mobx.dart';
part 'character_controller.g.dart';

class CharacterController = _CharacterController with _$CharacterController;

// flutter packages pub run build_runner build
abstract class _CharacterController with Store, CharacterAccess {

  int id;

  @observable
  bool loading = false;

  // init values.
  void init(int id, Character character) {
    this.id = id;
    if(character != null) {
      super.setCharacter(character);
    }
  }

  // Sync list of characters
  // obs: controller can handle pagination
  Future<void> fetchCharacterController() async {
    // if not exists a character
    if(character == null) {
      setLoading(true);
      await super.fetchCharacter(id);
      setLoading(false);
    }
  }

  @action
  setLoading(value){
    this.loading = value;
  }

  Character get character {
    return super.getCharacter();
  }

}