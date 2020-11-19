import 'package:marvel_app/app/modules/home/repositories/home_repository_interface.dart';
import 'package:marvel_app/app/shared/models/api_response.dart';
import 'package:marvel_app/app/shared/repositories/base_repository.dart';

class HomeRepository extends BaseRepository implements IHomeRepository {

  @override
  Future<ApiResponse> fetchCharactersList() {
    return get("/characters?orderBy=name&limit=30",
        "Message error");
  }
}