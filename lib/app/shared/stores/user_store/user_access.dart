
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_app/app/shared/stores/user_store/user_access_interface.dart';
import 'package:marvel_app/app/shared/stores/user_store/user_store.dart';

class UserAccess implements IUserAccess {

  UserStore _userStore = Modular.get();

  @override
  String getUserName() {
    return _userStore.getUserName();
  }

  @override
  void setUserName(value) {
    _userStore.setUserName(value);
  }

}