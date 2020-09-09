import 'package:marvel_app/app/modules/character/repositories/character_repository_interface.dart';
import 'package:marvel_app/app/shared/models/api_response.dart';
import 'package:marvel_app/app/shared/repositories/base_repository.dart';

class CharacterRepository extends BaseRepository implements ICharacterRepository {

  @override
  Future<ApiResponse> getCharacter(int id) {
    return get("/characters/$id",
        "Message error");
  }
}