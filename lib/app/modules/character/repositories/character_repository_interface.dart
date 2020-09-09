
import 'package:marvel_app/app/shared/models/api_response.dart';

abstract class ICharacterRepository {

  Future<ApiResponse> getCharacter(int id);
}