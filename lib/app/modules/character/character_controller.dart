import 'package:marvel_app/app/modules/character/stores/character_access.dart';
import 'package:marvel_app/app/shared/models/character.dart';
import 'package:marvel_app/app/shared/stores/user_store/user_access.dart';
import 'package:mobx/mobx.dart';
part 'character_controller.g.dart';

class CharacterController = _CharacterController with _$CharacterController;

// flutter packages pub run build_runner build
abstract class _CharacterController with Store, CharacterAccess, UserAccess {

  Character get character {
    return super.getCharacter();
  }

}