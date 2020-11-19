import 'package:marvel_app/app/modules/home/repositories/home_repository_interface.dart';
import 'package:marvel_app/app/modules/home/stores/home_access_interface.dart';
import 'package:marvel_app/app/shared/models/api_response.dart';
import 'package:marvel_app/app/shared/models/character.dart';
import 'package:mobx/mobx.dart';
part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

// flutter packages pub run build_runner build
abstract class _HomeStore with Store, IHomeAccess {

  @observable
  List<Character> characters = <Character>[];

  final IHomeRepository _homeRepository;

  _HomeStore(this._homeRepository);

  /// Busca a lista de personagens.
  Future<void> fetchCharactersList() async {
    ApiResponse apiResponse = await _homeRepository.fetchCharactersList();

    if(apiResponse.ok) {
      List<Character> characters = <Character>[];
      apiResponse.result['data']['results'].forEach((character) =>
          characters.add(Character.fromJson(character))
      );
      setCharacters(characters);
    } else {
      /// create error message view.
    }
  }

  @action
  setCharacters(value){
    this.characters = value;
  }

  @override
  List<Character> getCharacters() {
    return characters;
  }

}
