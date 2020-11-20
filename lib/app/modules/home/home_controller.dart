import 'package:marvel_app/app/modules/home/home_store.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

// flutter packages pub run build_runner build
abstract class _HomeController with Store {

  @observable
  bool loading = false;

  final HomeStore homeStore;

  _HomeController(this.homeStore);

  // Sync list of characters
  // obs: controller can handle pagination
  Future<void> fetchHome() async {
    setLoading(true);
    await homeStore.fetchCharactersList();
    setLoading(false);
  }

  @action
  setLoading(value){
    this.loading = value;
  }

}