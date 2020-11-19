
import 'package:marvel_app/app/shared/models/character.dart';

abstract class ICharacterAccess {

  Future<void> fetchCharacter(int id);

  void setCharacter(value);

  Character getCharacter();
}