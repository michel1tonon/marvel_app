import 'package:marvel_app/app/modules/home/stores/home_access.dart';
import 'package:marvel_app/app/shared/models/character.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

// flutter packages pub run build_runner build
abstract class _HomeController with Store, HomeAccess {

  @observable
  bool loading = false;

  // Sync list of characters
  // obs: controller can handle pagination
  Future<void> fetchHomeController() async {
    setLoading(true);
    await super.fetchCharactersList();
    setLoading(false);
  }

  // return characters
  List<Character> get characters {
    return super.getCharacters();
  }

  @action
  setLoading(value){
    this.loading = value;
  }

}