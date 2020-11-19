import 'package:marvel_app/app/modules/character/repositories/character_repository_interface.dart';
import 'package:marvel_app/app/modules/character/stores/character_access_interface.dart';
import 'package:marvel_app/app/shared/models/api_response.dart';
import 'package:marvel_app/app/shared/models/character.dart';
import 'package:mobx/mobx.dart';
part 'character_store.g.dart';

class CharacterStore = _CharacterStore with _$CharacterStore;

// flutter packages pub run build_runner build
abstract class _CharacterStore with Store, ICharacterAccess {

  @observable
  Character character;

  final ICharacterRepository _characterRepository;

  _CharacterStore(this._characterRepository);

  /// Busca a lista de personagens.
  Future<void> fetchCharacter(int id) async {
    ApiResponse apiResponse = await _characterRepository.fetchCharacter(id);

    if(apiResponse.ok) {
      setCharacter(Character.fromJson(apiResponse.result['data']['results'][0]));
    } else {
      /// create error message view.
    }
  }

  @action
  void setCharacter(value){
    this.character = value;
  }

  Character getCharacter() {
    return this.character;
  }
}
