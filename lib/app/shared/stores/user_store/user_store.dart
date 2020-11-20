
import 'package:marvel_app/app/shared/stores/user_store/user_access_interface.dart';
import 'package:mobx/mobx.dart';
part 'user_store.g.dart';

class UserStore = _UserStore with _$UserStore;

// flutter packages pub run build_runner build
abstract class _UserStore with Store, IUserAccess {

  @observable
  String name = "Michel Gazato Tonon";

  @override
  void setUserName(value) {
    this.name = value;
  }

  @override
  String getUserName() {
    return name;
  }
}