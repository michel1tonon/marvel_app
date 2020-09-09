import 'package:marvel_app/app/modules/home/home_store.dart';
import 'package:marvel_app/app/shared/models/character.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

// flutter packages pub run build_runner build
abstract class _HomeController with Store {

  @observable
  bool loading = false;

  final HomeStore _homeStore;

  // construct with store
  _HomeController(this._homeStore);

  // Sync list of characters
  // obs: controller can handle pagination
  Future<void> getCharactersList() async {
    setLoading(true);
    await _homeStore.getCharactersList();
    setLoading(false);
  }

  // return characters
  List<Character> get characters {
    return _homeStore.characters;
  }

  @action
  setLoading(value){
    this.loading = value;
  }

}