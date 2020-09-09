
import 'package:marvel_app/app/shared/models/api_response.dart';

abstract class IHomeRepository {

  Future<ApiResponse> getCharactersList();
}