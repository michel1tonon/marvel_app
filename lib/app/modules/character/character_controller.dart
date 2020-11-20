import 'package:marvel_app/app/shared/stores/user_store.dart';
import 'package:mobx/mobx.dart';
part 'character_controller.g.dart';

class CharacterController = _CharacterController with _$CharacterController;

// flutter packages pub run build_runner build
abstract class _CharacterController with Store {

  final UserStore userStore;

  _CharacterController(this.userStore);

}