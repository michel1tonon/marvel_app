
import 'package:marvel_app/app/shared/models/character.dart';

abstract class IHomeAccess {

  Future<void> fetchHomeCharactersList();

  void setHomeCharacters(value);

  List<Character> getHomeCharacters();
}