
import 'package:marvel_app/app/shared/models/character.dart';

abstract class IHomeAccess {

  Future<void> fetchCharactersList();

  void setCharacters(value);

  List<Character> getCharacters();
}