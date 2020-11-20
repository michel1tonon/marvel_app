
import 'package:mobx/mobx.dart';
part 'user_store.g.dart';

class UserStore = _UserStore with _$UserStore;

// flutter packages pub run build_runner build
abstract class _UserStore with Store {

  @observable
  String name = "Michel Gazato Tonon";

  @action
  setUserName(value) {
    this.name = value;
  }
}